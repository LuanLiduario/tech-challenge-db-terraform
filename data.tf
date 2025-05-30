resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}


data "aws_vpc" "selected" {
  id = aws_vpc.main.id
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    Name = "*-public-*"
  }
}

data "aws_subnet" "subnet_details" {
  for_each = toset(data.aws_subnets.selected.ids)
  id       = each.key
}
