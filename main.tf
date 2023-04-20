variable "ami" {}
variable "region" {}
variable "type" {}
variable "key_name" {}
variable "security_group_id" {}

module "aws_instance" {
  source = "./modules/aws_instance"

  ami         = var.ami
  region      = var.region
  instance_type = var.type
  key_name    = "mac_23"
  security_group_id = "sg-0fdca7d4d5179465b"
}

module "ansible_inventory" {
  source = "./modules/ansible_inventory"

  public_ip = module.aws_instance.public_ip
}
