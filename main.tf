provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

#resource "google_project_service" "gcp_services" {
#  for_each = toset(var.gcp_service_list)
#  project = "dot-boom"
#  service = each.key
#}

# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
name     = var.bucket_name
location = var.region
}

resource "google_compute_network" "default" {
  name   = "default"
}

resource "google_compute_address" "static" {
  for_each = toset(var.vm_instance_name)
  name     = "ipv4-address-${each.value}"
  region   = var.region
}

resource "google_compute_subnetwork" "default" {
  name          = "default-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.default.id
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  name         = "my-internal-address"
  subnetwork   = google_compute_subnetwork.default.id
  address_type = "INTERNAL"
  address      = "10.0.42.42"
  region       = var.region
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name
  target_tags   = ["allow-ssh"] // this targets our tagged VM
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "2022", "80", "443", "8080", "1000-2000", "6443"]
  }

  source_tags = ["web"]
}

resource "google_compute_instance" "vm" {
  for_each     = toset(var.vm_instance_name)
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
      nat_ip = google_compute_address.static["${each.value}"].address
    }
  }

  lifecycle {
    create_before_destroy = false
  }
}
