provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0b6d9d3d33ba97d99"  # Specify an appropriate AMI ID
    instance_type = "t3.micro"
    subnet_id = "subnet-0283e537af8b7a51c"
}
