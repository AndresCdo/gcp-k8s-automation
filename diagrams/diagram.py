from diagrams import Diagram, Cluster, Edge
from diagrams.gcp.compute import ComputeEngine
from diagrams.gcp.network import VPC, FirewallRules, ExternalIpAddresses
from diagrams.gcp.operations import Monitoring
from diagrams.onprem.network import Internet

# Define variables (example values, replace with actual values)
project_id = "your_project_id"
region = "your_region"
zone = "your_zone"
master_node_names = ["master-node"]
node_node_names = ["node-node-1", "node-node-2"]
gcp_service_list = ["compute.googleapis.com", "container.googleapis.com"]

with Diagram(f"GCP Infrastructure - {project_id}", show=False, direction="TB"):
    internet = Internet("Internet")

    with Cluster("GCP Project"):
        gcp_services = Monitoring("GCP Services")
        
        with Cluster(f"VPC Network - {region}"):
            vpc = VPC("vpc-cluster")
            
            firewall = FirewallRules("firewall-cluster")
            
            with Cluster("Subnets"):
                public_subnet = VPC("public-subnet\n10.1.0.0/16")
                private_subnet = VPC("private-subnet\n10.0.1.0/24")
            
            with Cluster("IP Addresses"):
                master_static_ips = [ExternalIpAddresses(f"Static IP \n {name}") for name in master_node_names]
                node_static_ips = [ExternalIpAddresses(f"Static IP \n {name}") for name in node_node_names]
                internal_ip = ExternalIpAddresses("Internal IP\n10.0.1.42")
            
            with Cluster(f"Compute Instances - {zone}"):
                master_instances = [ComputeEngine(name) for name in master_node_names]
                node_instances = [ComputeEngine(name) for name in node_node_names]
        
        # Null resource for waiting
        wait_resource = Monitoring("Wait 30 seconds")
        
        # SSH config and script execution
        ssh_config = Monitoring("SSH Configuration")
        execute_script = Monitoring("Execute Ansible Script")

    # Connections
    internet >> Edge(color="orange") >> [*master_static_ips, *node_static_ips]
    wait_resource >> Edge(color="purple", style="dotted") >> gcp_services
    gcp_services >> Edge(color="purple", style="dotted") >> vpc
    vpc >> Edge(color="brown") >> [public_subnet, private_subnet]
    vpc >> Edge(color="red", label="Firewall Rules") >> firewall
    
    for i, master in enumerate(master_instances):
        private_subnet >> Edge(color="blue") >> master_static_ips[i] >> Edge(color="green") >> master
    
    for i, node in enumerate(node_instances):
        public_subnet >> Edge(color="blue") >> node_static_ips[i] >> Edge(color="green") >> node
    
    private_subnet >> Edge(color="blue") >> internal_ip
    
    # SSH connections
    ssh_source = Internet("SSH Client")
    ssh_source >> Edge(color="gray", style="dashed", label="SSH") >> [*master_instances, *node_instances]
    
    # Configuration and script execution
    [*master_instances, *node_instances] >> Edge(color="gray", style="dashed") >> ssh_config >> execute_script

print(f"GCP Infrastructure diagram for project {project_id} created successfully. Check the output file in the current directory.")