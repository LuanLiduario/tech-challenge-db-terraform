data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
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
