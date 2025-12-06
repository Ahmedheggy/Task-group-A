resource "aws_db_instance" "mysql" {
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  storage_type       = "gp2"
  db_name            = "mydb"
  username           = "admin"
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.id
  vpc_security_group_ids = [var.backend_sg_id]
  backup_retention_period = 7
  multi_az           = false
  publicly_accessible = false

  tags = {
    Name        = "MySQL Database"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "main" {
  name        = "main-db-subnet-group"
  subnet_ids  = var.private_subnet_ids
  description = "Main DB subnet group"
}