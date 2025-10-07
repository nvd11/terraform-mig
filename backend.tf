terraform {
  backend "gcs" {
    bucket  = "jason-hsbc"
    prefix  = "terraform/mig/state"
  }
}
