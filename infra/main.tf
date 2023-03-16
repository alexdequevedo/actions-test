resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "tf_state" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true # Required by organizational policy constraint
  public_access_prevention    = "enforced"

  logging {
    log_bucket = "f06a2c1ff1e18fb2-bucket-tfstate"
  }

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
  project = var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.tf_service_account.email}"
}


# Enable APIs

resource "google_project_service" "project" {
  for_each = toset(["iam.googleapis.com", "storage.googleapis.com", "cloudresourcemanager.googleapis.com", "compute.googleapis.com"])

  project = var.project_id
  service = each.key

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
