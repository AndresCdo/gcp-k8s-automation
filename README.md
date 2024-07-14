# Kubernetes and Docker Infrastructure Automation

This project automates the provisioning and management of a Kubernetes cluster and Docker environment using Ansible and Terraform. It is designed to streamline the setup of a Kubernetes cluster on Google Cloud Platform (GCP) along with Docker configuration for container management.

## Project Structure

The project is organized into two main components: Terraform for infrastructure provisioning and Ansible for configuration management.

### Diagram

The following diagram illustrates the infrastructure components created by Terraform in your GCP project:
![GCP Infrastructure Diagram](./diagram/gcp_infrastructure_-_your_project_id.png)

The diagram shows the VPC network, subnets, and compute instances provisioned by Terraform. The Ansible playbooks will configure Docker and Kubernetes on the instances.

### Terraform

- `main.tf`: Contains the Terraform configuration for provisioning the GCP infrastructure, including VPC, subnets, and compute instances.
- `variables.tf`: Defines the variables used in Terraform configurations.
- `terraform.tfvars`: Provides the values for the predefined variables in `variables.tf`.
- `terraform-workflow.sh`: A shell script to automate the execution of Terraform commands.

### Ansible

Located under the `ansible-provider` directory, it contains playbooks and roles for configuring Docker and Kubernetes on the provisioned infrastructure.

- `conf/`: Configuration files for Docker and Kubernetes resources.
- `roles/`: Ansible roles for setting up Docker and Kubernetes.
- `playbook.yml`: The main Ansible playbook that applies the defined roles to the target hosts.

## Setup Instructions

1. **Prerequisites**:
   - Install Ansible and Terraform on your local machine.
   - Configure GCP credentials by setting up a service account and downloading its key file.

2. **Infrastructure Provisioning with Terraform**:
   - Navigate to the project root directory.
   - Run `./terraform-workflow.sh init` to initialize Terraform.
   - Execute `./terraform-workflow.sh apply` to provision the infrastructure on GCP.

3. **Configuration with Ansible**:
   - Change to the `ansible-provider` directory.
   - Update the inventory file with the IP addresses of your GCP instances.
   - Run `ansible-playbook playbook.yml` to configure Docker and Kubernetes on the provisioned infrastructure.

## Customization

You can customize the Docker and Kubernetes configurations by editing the files in the `ansible-provider/conf` directory. Adjust the Terraform variables in `terraform.tfvars` to match your specific GCP project details and infrastructure requirements.

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests with your enhancements.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
