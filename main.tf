variable "ami" {}
variable "region" {}
variable "type" {}
variable "name" {}
variable "tags" {}
variable "key_name" {}
variable "public_key_path" {}

provider "aws" {
  region     = var.region
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

output "key_name" {
  value = aws_key_pair.ssh_key.key_name
}

resource "aws_security_group" "web" {
  name_prefix = var.name
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

output "security_group_id" {
  value = aws_security_group.web.id
}

resource "aws_instance" "githubapi" {
  ami           = var.ami
  instance_type = var.type
  key_name      = "labos"
  vpc_security_group_ids =  [""]
}

output "web_app_access_ip" {  
  value = aws_instance.web_app.public_ip
}

resource "local_file" "inventory" {
  content = <<-EOT
    [myhosts]
    ${aws_instance.web_app.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/mac_23.pem
  EOT

  filename = "/etc/ansible/hosts"
}