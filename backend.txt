terraform {
  backend "s3" {
    bucket = "Terraform_mybucket"
    key    = "Terraform.tfstate"
    region = "us-east-2"
  }
}
