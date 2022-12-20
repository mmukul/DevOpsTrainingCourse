provider "google" {
    project = ""
    credentials = "${file("credentials.json")}"
    region = "us-central1"
    zone = "us-central1-c"
}

resource "google_compute_instance" "my_instance" {
    name = "terrform-instance"
    machine_type = "fi-micro"
    zone = "us-central1-a"
    allow_stopping_for_update = true

    boot_disk {
      initialize_params {
        image = ""
      }
    }

    network_interface {
      network = "default"
      access_config {
        //necessary even empty
      }
    }
}