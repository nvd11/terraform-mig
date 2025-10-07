# Terraform Google Cloud MIG Module

This Terraform module creates a Managed Instance Group (MIG) in Google Cloud Platform.

## Usage

You can use this module by adding a module block to your Terraform configuration and specifying the Git URL as the source.

```hcl
module "my_mig" {
  source                = "git@github.com:nvd11/terraform-mig.git"
  
  name                  = "my-instance-group"
  zone                  = "us-central1-a"
  machine_type          = "e2-medium"
  source_image          = "debian-cloud/debian-11"
  subnetwork            = "default"
  service_account_email = "your-service-account@your-project.iam.gserviceaccount.com"
  target_size           = 2
  startup_script        = "#!/bin/bash\necho 'Hello, World!' > /var/log/startup.log"
}
```

## Inputs

| Name                  | Description                                                 | Type   | Default  | Required |
| --------------------- | ----------------------------------------------------------- | ------ | -------- | :------: |
| `name`                | The name of the managed instance group.                     | `string` |          |   yes    |
| `zone`                | The zone where the managed instance group will be created.  | `string` |          |   yes    |
| `machine_type`        | The machine type for the instances.                         | `string` | `e2-small` |    no    |
| `source_image`        | The source image for the instances' boot disks.             | `string` |          |   yes    |
| `subnetwork`          | The subnetwork to which the instances will be attached.     | `string` |          |   yes    |
| `service_account_email` | The email of the service account to be used by the instances. | `string` |          |   yes    |
| `target_size`         | The number of instances in the managed instance group.      | `number` | `1`      |    no    |
| `startup_script`      | The startup script to be executed on instance boot.         | `string` | `""`     |    no    |

## Outputs

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| `instance_group_manager_name` | The name of the managed instance group manager. |
| `instance_group_manager_id`   | The ID of the managed instance group manager.   |
| `instance_template_name`    | The name of the instance template.             |
