provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "fastfood_db" {
  identifier           = "fastfood-db"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  port                 = 5432
  publicly_accessible  = true
  skip_final_snapshot  = true
}

