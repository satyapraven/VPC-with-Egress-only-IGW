variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs to be associated with the route table"
  type        = list(string)
  validation {
    condition     = length(var.public_subnets) > 0
    error_message = "At least one public subnet ID must be provided"
  }
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Environment = "Production"
    Terraform   = "true"
  }
}