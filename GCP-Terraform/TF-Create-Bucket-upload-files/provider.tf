terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.13.0"
    }
  }
}

provider "google" {
  project = "rvgcp1000"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = file("../Credentials/rvgcp1000.json")
}

