variable "aws_region" {
  description = "The AWS region where resources will be created."
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The Amazon Machine Image (AMI) ID to use for the EC2 instance."
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instance."
}