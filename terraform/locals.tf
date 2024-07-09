locals {
  region        = "us-east-1"
  cidr_all      = ["0.0.0.0/0"]
  instance_type = var.instance_type
  names         = var.names
  subnet_id     = var.subnet_id
}
