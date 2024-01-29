#Defind resrouce of GCP for storage creation

resource "google_storage_bucket" "static" {
  name          = "test-store-com123432323"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}

## Upload an object into the bucket
resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01" ##Name of this resource
  source = "./upload_image/download.jpeg"
  bucket = google_storage_bucket.static.name   ##bucket name
}
