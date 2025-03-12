provider "aws" {
    region = "eu-north-1"
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "gdc-eks-state-store"
    lifecycle {
        prevent_destroy = false
    }
}

resource "aws_dynamodb_table" "my_table" {
    name           = "eks-lock-table"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
