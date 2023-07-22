variable "vpc_id" {
  description = "VPC ID"
  type        = string
  nullable    = false
}

variable "rt_name" {
  description = "Route table name"
  type        = string
  nullable    = false
}

variable "igw_name" {
  description = "Internet gateway name"
  type        = string
  default     = null
  nullable    = true
}


variable "destination_cidr_block" {
  description = "The destination CIDR block"
  type        = string
  nullable    = false
}

variable "network_interface_id" {
  description = "Identifier of an EC2 network interface"
  type        = string
  default     = null
  nullable    = true
}
