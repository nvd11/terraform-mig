variable "name" {
  description = "The name of the managed instance group."
  type        = string
}

variable "zone" {
  description = "The zone where the managed instance group will be created."
  type        = string
}

variable "machine_type" {
  description = "The machine type for the instances."
  type        = string
  default     = "e2-small"
}

variable "source_image" {
  description = "The source image for the instances' boot disks."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to which the instances will be attached."
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to be used by the instances."
  type        = string
}

variable "target_size" {
  description = "The number of instances in the managed instance group."
  type        = number
  default     = 1
}

variable "startup_script" {
  description = "The startup script to be executed on instance boot."
  type        = string
  default     = ""
}

variable "spot" {
  description = "If true, creates Spot VMs. This also sets on_host_maintenance to TERMINATE."
  type        = bool
  default     = true
}
