provider "google" {
  credentials = file("terraform.json")
  project = "ishaqgcpproject"
  region  = "us-west1"
  
}

resource "google_compute_instance" "vm-instance" {
  name         = "target-vm"
  machine_type = "f1-micro"
  zone         = "us-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
 
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
