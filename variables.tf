variable "project_id" {
  description = "The ID of the project"
  default     = "jason-hsbc" 
  type        = string
}

variable "region_id" {
  description = "The region of the project"
  default     = "europe-west2" 
  type        = string
}

variable "zone_id" {
  description = "The zone id of the project"
  default     = "europe-west2-c" 
  type        = string
}

//https://cloud.google.com/iam/docs/service-agents
variable "gcs_sa" {
  description = "built-in service acount of GCS"
  default     = "service-912156613264@gs-project-accounts.iam.gserviceaccount.com" 
  type        = string
}

//https://cloud.google.com/iam/docs/service-agents
variable "sts_sa" {
  description = "built-in service acount of Storage Transer service"
  default     = "project-912156613264@storage-transfer-service.iam.gserviceaccount.com" 
  type        = string
}

variable "vpc0" {
  description = "The name of the VPC network"
  default     = "tf-vpc0"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  default     = "e2-medium"
  type        = string
}

variable "source_image" {
  description = "The source image for the VM instance"
  default     = "debian-cloud/debian-11"
  type        = string
}

variable "vm_common_sa" {
  description = "The email of the vm-common service account"
  default     = "vm-common@jason-hsbc.iam.gserviceaccount.com"
  type        = string
}
