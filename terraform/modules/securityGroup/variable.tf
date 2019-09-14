
variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "environment_tag" {
  description = "Environment tag"
  default = "Test"
}