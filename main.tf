provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# resource "google_project_service" "gcp_services" {
#   for_each = toset(var.gcp_service_list)
#   project = "dot-boom"
#   service = each.key
# }

# Create a GCS Bucket
# resource "google_storage_bucket" "default" {
#   name     = var.bucket_name
#   location = var.region
# }

# Create VPC
resource "google_compute_network" "default" {
  name   = "default"
}

# Create Subnet
##  Create public subnet
resource "google_compute_subnetwork" "default" {
  name          = "public-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.default.id
}

## Create private subnet
resource "google_compute_subnetwork" "internal" {
  name          = "private-subnet"
  ip_cidr_range = "10.51.1.0/24"
  region        = var.region
  network       = google_compute_network.default.id
  private_ip_google_access = "true"
}

resource "google_compute_address" "master-static" {
  for_each = toset(var.master_node_name)
  name     = "ipv4-address-${each.value}"
  region   = var.region
}

resource "google_compute_address" "worker-static" {
  for_each = toset(var.worker_node_name)
  name     = "ipv4-address-${each.value}"
  region   = var.region
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  name         = "private-ip"
  subnetwork   = google_compute_subnetwork.internal.id
  address_type = "INTERNAL"
  address      = "10.51.1.42"
  region       = var.region
}

resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = google_compute_network.default.name
  target_tags   = ["allow-ssh"] // this targets our tagged VM
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "2022", "80", "443", "8080", "1000-2000", "6443", "6783", "10250-10253"]
  }

  source_tags = ["web"]
}

resource "google_compute_instance" "master" {
  for_each     = toset(var.master_node_name)
  name         = each.value
  machine_type = "${var.machine_type}"
  tags         = ["allow-ssh"] // this receives the firewall rule

  boot_disk {
    initialize_params {
      image = "${var.linux_image}"
    }
  }
  
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
  
  network_interface {
    # A default network is created for all GCP projects
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.internal.name 
    access_config {
      nat_ip = google_compute_address.master-static["${each.value}"].address
    }
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "google_compute_instance" "worker" {
  for_each     = toset(var.worker_node_name)
  name         = each.value
  machine_type = "${var.machine_type}"
  tags         = ["allow-ssh"] // this receives the firewall rule

  boot_disk {
    initialize_params {
      image = "${var.linux_image}"
    }
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
  
  network_interface {
    # A default network is created for all GCP projects
    network    = google_compute_network.default.name
    subnetwork = google_compute_subnetwork.default.name
    access_config {
      nat_ip = google_compute_address.worker-static["${each.value}"].address
    }
  }

  lifecycle {
    create_before_destroy = false
  }
}

