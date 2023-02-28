resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "tf_state" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true # Required by organizational policy constraint

  versioning {
    enabled = true
  }
}

# ##################################################
# Terraform Service Account
# ##################################################

resource "google_service_account" "tf_service_account" {
  project      = var.project_id
  account_id   = "terraform-service-account"
  display_name = "terraform-service-account"
  description  = "Service account for Managing Terraform"
}

resource "google_project_iam_member" "tf_iam_member" {
  for_each = toset(["roles/editor"]) # Will remove for_each if we just grant editor / admin role rather than individual permissions

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.tf_service_account.email}"
}
