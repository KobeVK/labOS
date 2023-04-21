variable "ami" {}
variable "region" {}
variable "type" {}
variable "key_name" {}
variable "security_group_id" {}

# provider "aws" {
#   alias  = "eu-west-2"
#   region = "eu-west-2"
# }

resource "aws_instance" "web_app" {
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
}

output "public_ip" {
  value = aws_instance.web_app.public_ip
}