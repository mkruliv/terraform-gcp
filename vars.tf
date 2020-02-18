# Input variable: Name of Google Cloud Storage bucket
variable bucket_name {
  description = "The name of the Google Cloud Storage bucket. Must be globally unique."
  default     = "terraform-my-bucket"
}

variable instance_name {
  description = "The name of the GCP Instance."
  default     = "tf-testinstance"
}

variable instance_type {
  description = "The type of GCP Instance."
  default     = "f1-micro"
}

variable zone {
  default = "europe-west3-b"
}

variable region {
  default = "europe-west3"
}

variable gcp_credentials {
  default = "../tf-example.json"
}

variable gcp_project {
  default = "terraform-test-project"
}