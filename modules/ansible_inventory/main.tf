variable "public_ip" {}

resource "local_file" "inventory" {
  content = <<-EOT
    [myhosts]
    ${var.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/labos.pem
  EOT

  filename = "/etc/ansible/hosts"
}
