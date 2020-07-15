provider "aws" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

# Create db instance 1
resource "aws_db_instance" "guidb1" {
  identifier = "guidb"
  instance_class = "db.t2.micro"
  allocated_storage = 10
  engine = "mysql"
  name = "guidb"
  password = "sapaim"
  username = "guilherme"
  engine_version = "5.7.00"
  skip_final_snapshot = true
  db_subnet_group_name = "default"
}