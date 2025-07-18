resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type
  key_name      = "your-ec2-keypair-name"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "TerraformInstance"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "allow_custom_port"
  description = "Allow custom port inbound traffic"

  ingress {
    from_port   = var.custom_port
    to_port     = var.custom_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
