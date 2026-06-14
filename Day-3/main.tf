provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-0521cb2d60cfbb1a6" # replace this
  instance_type_value = "t3.micro"
  subnet_id_value = "subnet-03465ffb835f65865" # replace this
}
