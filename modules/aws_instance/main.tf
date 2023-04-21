variable "ami" {}
variable "region" {}
variable "type" {}
variable "key_name" {}
variable "security_group_id" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web_app" {
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
}

output "public_ip" {
  value = aws_instance.web_app.public_ip
}