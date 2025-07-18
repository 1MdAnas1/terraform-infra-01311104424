provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "custom_sg" {
  name        = "custom-port-sg"
  description = "Allow inbound traffic on custom port"

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

resource "aws_instance" "ubuntu_server" {
  ami           = "ami-0c02fb55956c7d316"  # Ubuntu Server 20.04 LTS (for us-east-1)
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.custom_sg.name]

  tags = {
    Name = "UbuntuInstance"
  }
}
