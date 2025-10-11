resource "google_compute_instance_template" "mig_template" {
  name_prefix  = "${var.name}-"
  machine_type = var.machine_type

  lifecycle {
    create_before_destroy = true
  }

  disk {
    source_image = var.source_image
    auto_delete  = true
    boot         = true
  }
  network_interface {
    subnetwork = var.subnetwork
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  scheduling {
    provisioning_model  = var.spot ? "SPOT" : "STANDARD"
    on_host_maintenance = var.spot ? "TERMINATE" : "MIGRATE"
    automatic_restart   = !var.spot
    preemptible         = var.spot
  }

  metadata_startup_script = var.startup_script
}

resource "google_compute_instance_group_manager" "mig" {
  name               = var.name
  base_instance_name = "${var.name}-vm"
  zone               = var.zone
  target_size        = var.target_size

  version {
    name              = "v1"
    instance_template = google_compute_instance_template.mig_template.id
  }
}
