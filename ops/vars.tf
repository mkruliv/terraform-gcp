# Input variable: Name of Google Cloud Storage bucket


variable gcp_credentials {
  default = "../../tf-test.json"
}

variable project_id {
  default = "terraform-test-project-268616"
}

variable region {
  description = "The GCP region to create and test resources in"
  type        = string
  default     = "europe-west3"
}

variable subnetwork {
  description = "The subnetwork selflink to host the compute instances in"
  default     = "default"
}

variable num_instances {
  description = "Number of instances to create"
  default     = 1
}

variable service_account {
  default = null
  type = object({
    email  = string,
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
}