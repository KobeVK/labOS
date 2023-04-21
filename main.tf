variable "ami" {}
variable "region" {}
variable "type" {}

module "ssh_key" {
  source          = "./modules/ssh_key"
  key_name        = "key"
  public_key_path = "~/.ssh/key.pub"
}

module "security_group" {
  source      = "./modules/security_group"
  name        = "web"
  tags = {
    Name = "web"
  }
}

module "aws_instance" {
  source            = "./modules/aws_instance"
  ami               = var.ami
  type              = var.type
  region            = var.region
  security_group_id = module.security_group.security_group_id
  key_name          = module.ssh_key.key_name
}

module "ansible_inventory" {
  source    = "./modules/ansible_inventory"
  public_ip = module.aws_instance.public_ip
}


# module "vpc" {
#     source = "terraform-aws-modules/vpc/aws"
#     version = "3.14.0"

#     name = var.vpc_name
#     cidr = var.vpc_cidr

#     azs = var.vpc_azs
#     private_subnets = var.vpc_private_subnets
#     public_subnets = var.vpc_public_subnets

#     enable_nat_gateway = var.vpc_enable_nat_gateway

#     tags = var.vpc_tags
# }

# provider "aws" {
#   alias  = "eu-west-2"
#   region = "eu-west-2"
# }