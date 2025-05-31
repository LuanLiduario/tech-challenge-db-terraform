resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = data.aws_subnets.selected.ids

  tags = {
    Name = "MainSubnetGroup"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow PostgreSQL access"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 5432
    to_port     = 5432
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

resource "aws_db_instance" "fastfood_db" {
  identifier           = "fastfood-db"
  allocated_storage    = 20
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_password
  port                 = 5432
  skip_final_snapshot  = true
  publicly_accessible  = true
  apply_immediately    = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}
