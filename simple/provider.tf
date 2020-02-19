# Configure the Google Cloud provider
provider "google" {
  project     = "ss-kubertest-project"
  credentials = var.gcp_credentials
  region      = var.region
}