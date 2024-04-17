provider "volterra" {
  api_p12_file = var.f5xc_api_p12_file
  url          = var.f5xc_api_url
  alias        = "default"
}

provider "google" {
  # credentials = file(var.gcp_application_credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = format("%s-%s", var.gcp_region, var.gcp_zone)
  alias       = "default"
}