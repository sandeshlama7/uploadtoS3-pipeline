variable "instance_type" {
  description = "Instance type to use for the EC2"
  type        = string
}
variable "names" {
  description = "Names for different resources"
  type        = map(string)
}
variable "subnet_id" {
  description = "Subnet ID of poc us-east-1f public subnet"
  type        = string
}
variable "ami" {
  description = "Ami of the EC2"
  type        = string
}
