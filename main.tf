variable "ami" {}
variable "region" {}
variable "type" {}

# provider "aws" {
#   alias  = "eu-west-2"
#   region = "eu-west-2"
# }

module "ssh_key" {
  source          = "./modules/ssh_key"
  key_name        = "labos"
  public_key_path = "~/.ssh/labos.pub"
}

module "security_group" {
  source      = "./modules/security_group"
  name        = "web"
  tags = {
    Name = "web"
  }
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

module "aws_instance" {
  source            = "./modules/aws_instance"
  # name              = "GithubApiApp"
  ami               = var.ami
  type              = var.type
  region            = var.region
  security_group_id = module.security_group.security_group_id
  key_name          = module.ssh_key.key_name
  # providers = {
  #   aws = aws.eu-west-2
  # }
}

module "ansible_inventory" {
  source    = "./modules/ansible_inventory"
  public_ip = module.aws_instance.public_ip
}