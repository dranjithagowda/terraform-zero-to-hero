provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://98.81.238.77:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "3c3436dd-8674-b97f-8df6-9de934f07c9c"
      secret_id = "15a6a5d0-d905-7524-b33c-65393aeca3b6"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t3.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["foo"]
  }
}
