resource "google_compute_network" "quakejs" {
  name = "quakejs"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "quakejs" {
  network = google_compute_network.quakejs.name
  name    = "quakejs"
  region  = var.region

  ip_cidr_range = var.cidr_range
}

resource "google_compute_firewall" "allow_icmp" {
  network = google_compute_network.quakejs.name
  name    = "allow-icmp"

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "allow_ssh" {
  network = google_compute_network.quakejs.name
  name    = "allow-ssh"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_http" {
  network = google_compute_network.quakejs.name
  name    = "allow-http"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_firewall" "allow_quake_server_ws" {
  network = google_compute_network.quakejs.name
  name    = "allow-quake-server-ws"

  allow {
    protocol = "tcp"
    ports    = ["27960"]
  }
}