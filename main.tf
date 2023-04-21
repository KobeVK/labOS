variable "ami" {
  default = "ami-08c4559b664a2c695"
}
variable "region" {
  default = "eu-west-3"
}
variable "type" {
  default = "t2.large"
}
variable "name" {
  default = "githubAPI"
}
variable "tags" {
  default = {
    Owner = "Kobe"
    Environment = "Dev"
  }
}

provider "aws" {
  region     = var.region
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
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
            #!/bin/bash
            apt-get update
            apt-get install -y docker.io
            curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            chmod +x /usr/local/bin/docker-compose
            echo "${base64encode(file("docker-compose.yml"))}" | base64 --decode > /root/docker-compose.yml
            docker-compose -f Docker/docker-compose.yml up -d
            EOF
}

output "web_app_access_ip" {  
  value = aws_instance.githubapi.public_ip
}

# resource "local_file" "inventory" {
#   content = <<-EOT
#     [myhosts]
#     ${aws_instance.githubapi.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/labos.pem
#   EOT

#   filename = "/etc/ansible/hosts"
# }
