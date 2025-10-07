resource "google_compute_instance_template" "my-mig-template" {
  name         = "instance-template-example-v3"
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
    subnetwork = "tf-vpc0-subnet0"
  }
  service_account {
    email  = var.vm_common_sa
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = "echo 'Instance started at $(date)' >> /var/log/startup.log"
}

resource "google_compute_instance_group_manager" "my-mig1" {
  name               = "instance-group-example"
  base_instance_name = "vm-example"
  zone               = var.zone_id
  target_size        = 1

  version {
    name              = "v1"
    instance_template = google_compute_instance_template.my-mig-template.id
  }
}
