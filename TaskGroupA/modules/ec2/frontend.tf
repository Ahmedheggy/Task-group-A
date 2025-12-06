resource "aws_instance" "frontend" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = file("${path.module}/bootstrap/frontend.sh")

  tags = {
    Name        = "${var.environment}-frontend"
    Environment = var.environment
  }
}
