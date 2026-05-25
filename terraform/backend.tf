terraform {
  backend "s3" {
    bucket = "project-bedrock-tfstate-alt-soe-025-3586"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}