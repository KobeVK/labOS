
variable "key_name" {}
variable "public_key_path" {}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

output "key_name" {
  value = aws_key_pair.ssh_key.key_name
}