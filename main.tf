provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "fastfood_db" {
  identifier         = "fastfood-db"
  engine             = "postgres"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  name               = "fastfood"
  username           = "postgres"
  password           = "mysecretpassword"
  port               = 5432
  publicly_accessible = true
  skip_final_snapshot = true
}
