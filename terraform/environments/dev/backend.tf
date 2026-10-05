terraform {
  backend "s3" {
    bucket = "terraform-bucket"
    key    = "dev/terraform.tfstate"
    region = "MUM1"

    endpoints = { s3 = "https://objectstore.mum1.civo.com" }

    use_path_style              = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}
