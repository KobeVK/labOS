variable "ami" {
  default = "ami-08c4559b664a2c695"
}
variable "region" {
  default = "eu-west-3"
}
variable "type" {
  default = "t2.micro"
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
# variable "key_name" {
#   default = "labos"
# }

# variable "public_key_path" {
#   default = "~/.ssh/labos.pub"
# }

provider "aws" {
  region     = var.region
}

# resource "aws_key_pair" "ssh_key" {
#   key_name   = var.key_name
#   public_key = file(var.public_key_path)
# }

# output "key_name" {
#   value = aws_key_pair.ssh_key.key_name
# }

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
