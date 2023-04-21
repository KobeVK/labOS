variable "ami" {}
variable "region" {}
variable "type" {}
variable "key_name" {}
variable "security_group_id" {}

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#     }
#   }
# }

# provider "aws" {
#   region = "eu-west-3"
# }

# resource "aws_instance" "web_app" {
#   ami           = var.ami
#   instance_type = var.type
#   key_name      = var.key_name
#   vpc_security_group_ids = [var.security_group_id]
# }

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  tags = {
    Name = "example-instance"
  }
}

output "public_ip" {
  value = aws_instance.web_app.public_ip
}