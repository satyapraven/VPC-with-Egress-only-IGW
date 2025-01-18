variable "vpc_id" {
  description = "The ID of the VPC for which subnets are being created"
  type        = string
}

variable "region" {
  description = "AWS region where subnets will be created"
  type        = string
}