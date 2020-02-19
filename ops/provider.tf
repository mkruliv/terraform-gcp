# Configure the Google Cloud provider
provider "google" {
  project     = "terraform-test-project-268616"
  credentials = var.gcp_credentials
  region      = var.region
}