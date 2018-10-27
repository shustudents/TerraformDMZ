terraform {
  backend "s3" {
    bucket = "dmzterraformstate"
    key = "qa/terraform.tfstate"
    encrypt = "true"
    region = "us-east-1"
    dynamodb_table = "terraformlockstate"
#    profile = "default"
    }

    versioning {
      enabled = true
    }
    lifecycle {
    prevent_destroy = true
    }
}

