provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "chinmai" {
  instance_type = "t3.micro"
  ami = "ami-0521cb2d60cfbb1a6" # change this
  subnet_id = "subnet-0283e537af8b7a51c" # change this
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "chinmai-s3-demo-xyz" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
