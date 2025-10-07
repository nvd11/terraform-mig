output "instance_group_manager_name" {
  description = "The name of the managed instance group manager."
  value       = google_compute_instance_group_manager.mig.name
}

output "instance_group_manager_id" {
  description = "The ID of the managed instance group manager."
  value       = google_compute_instance_group_manager.mig.id
}

output "instance_template_name" {
  description = "The name of the instance template."
  value       = google_compute_instance_template.mig_template.name
}
