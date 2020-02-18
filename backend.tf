terraform {
  backend "gcs" {
    bucket      = "mt-test-tfstates"
    prefix      = "test"
    credentials = "../tf-example.json"
  }
}