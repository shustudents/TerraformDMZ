terraform {
  backend "s3" {
    bucket = "qaterraformstate"
    key = "qa/terraform.tfstate"
    encrypt = "true"
    region = "us-east-1"
    dynamodb_table = "dynamotable"
    profile = "default"
    }

    versioning {
      enabled = true
    }
    lifecycle {
    prevent_destroy = true
    }
}

