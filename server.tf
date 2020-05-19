resource "google_compute_instance" "quakejs" {
  name         = "quakejs-server"
  machine_type = var.machine_type
  zone         = format("%s-%s", var.region, var.zone)

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.quakejs.name

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    enable-oslogin = true
  }

  metadata_startup_script = file(var.metadata_startup_script)
}