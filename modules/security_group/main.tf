

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
