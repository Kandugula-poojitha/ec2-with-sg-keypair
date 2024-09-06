
resource "aws_security_group" "security-group1" {

  name        = "security-group1"
  description = "Allow inbound traffic on ports 22 and 80 and outbound for all traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_key_pair" "example" {
  key_name   = "keypair-1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDrl1tPCS/MwsxSFM8GdkyfzbZ7jIrWhC1vhhP9WVuPM2ETIzrwMHpWIp1U1E8ydHfKYaaDtZny9mVrtd758JTlPVB9oAfopXiCd5o/L9zmL/3yhVUdgm1jq5CZplxoAETSi4NTuGG99oafxAvJkI3C+fgzuRMdOdndszTAqHp7fAfyJNdZrR2Jmu6Vur+0uC8oCFFesZykb7felZEz0HA1ry/XDm9IWwMxrzpKhCKMCF9hziNqGLld1Z2xa5YV4K38RqevutHsAdr2MewLK3XLi1AwNDNDt7HxS0ZdWf6qRgFVx9bdL1NQmVcQizX8rBT9xuZLixz72bLTd/OSWS6X kandugula nagesh@Nagesh-22"

}

resource "aws_instance" "instance-1" {
  ami                    = var.ami-id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.security-group1.id]

  tags = {
    Name = "instance-1"
  }
}

