provider "google" {
  project = "githubactions-444207"
  region  = "us-central1"
}

resource "google_project_service" "compute" {
  project = "githubactions-444207"
  service = "compute.googleapis.com"
}

resource "google_compute_instance" "default" {
  depends_on = [google_project_service.compute]

  name         = "my-vm"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}