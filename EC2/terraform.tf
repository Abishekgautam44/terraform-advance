terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.0.0"
    }
  }

  # backend "s3" {
  #   bucket = "abis-buckett"
  #   key = "terraform.tfstate"
  #   region = "us-east-1"
  #   dynamodb_table = "abis-db-table"
  # }
}