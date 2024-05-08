provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  access_key                  = "teste"
  secret_key                  = "teste"

  endpoints {
    #    ec2 = "http://ec2.localhost.localstack.cloud:4566"
    ec2 = "http://localhost:4566"
  }
}

resource "aws_instance" "vm-aula2" {
  ami           = "ami-0d57c0143330e1fa7"
  instance_type = "t2.micro"
}

