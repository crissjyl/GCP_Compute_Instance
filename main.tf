variable "project" {
  description = "GCP Compute"
}

variable "us-west2-a" {
  description = "us-west2-a"
}

provider "google" {
 #credentials = file"${var.gcp_credentials}"
  project     = "${var.gcp_project}"
  region      = "${var.gcp_region}"

}

resource "google_compute_instance" "demo" {
  name          = "${var.instance_name}"
  machine_type  = "${var.machine_type}"
  zone          = "${var.gcp_zone}"
  
  boot_disk {
    initialize_params {
      image = "${var.image}"
      }
    }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
      }
    }
}

output "externap_ip"{
  value = "${google_compute_instance.demo.network_interface.0.access_config.0.assigned_nat_ip}"
  }
