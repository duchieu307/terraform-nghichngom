
variable "env" {
  type        = string
  description = "Project Environment"
}

variable "project_name" {
  type        = string
  description = "Project Name"

}

# variable "availability_zone" {
#   type        = string
#   description = "Project Avaibility Zone"
# }


variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"

}

# variable "public_subnet_cidr_block" {
#   type        = string
#   description = "Public Subnet CIDR Block"

# }

# variable "private_subnet_cidr_block" {
#   type        = string
#   description = "Private Subnet CIDR Block"

# }

variable "public_subnet_numbers" {
  type        = map(number)
  description = "Map of AZ to a number that should be used for public subnets"
}

variable "private_subnet_numbers" {
  type        = map(number)
  description = "Map of AZ to a number that should be used for public subnets"
}


