resource "google_compute_instance" "boot_disk_deny_1" {
  name         = "boot-disk-deny-1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
}

resource "google_compute_instance" "attached_disk_deny_1" {
  name         = "attached-disk-deny-1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    source = google_compute_disk.attached_1_deny_1.name
  }

  attached_disk {
    source = google_compute_disk.attached_2_deny_1.name
  }
}

resource "google_compute_instance" "attached_disk_deny_2" {
  name         = "attached-disk-deny-2"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    source = google_compute_disk.attached_1_deny_2.name
  }

  attached_disk {
    source = google_compute_disk.attached_2_deny_2.name
  }

  attached_disk {
    source = google_compute_disk.attached_3_deny_2.name
  }
}

resource "google_compute_disk" "deny_1" {
  name = "boot-disk-deny-1"
  type = "pd-ssd"
  zone = "us-central1-a"
}

resource "google_compute_disk" "attached_1_deny_1" {
  name = "attached-1-disk-deny-1"
  type = "pd-ssd"
  zone = "us-central1-a"
}

resource "google_compute_disk" "attached_2_deny_1" {
  name = "attached-2-disk-deny-1"
  type = "pd-ssd"
  zone = "us-central1-a"
}

resource "google_compute_disk" "attached_1_deny_2" {
  name = "attached-1-disk-deny-2"
  type = "pd-ssd"
  zone = "us-central1-a"
}

resource "google_compute_disk" "attached_2_deny_2" {
  name = "attached-2-disk-deny-2"
  type = "pd-ssd"
  zone = "us-central1-a"
}

resource "google_compute_disk" "attached_3_deny_2" {
  name = "attached-3-disk-deny-2"
  type = "pd-ssd"
  zone = "us-central1-a"
}
