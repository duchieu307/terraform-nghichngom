variable "ec2_ami" {
  type        = string
  description = "EC2 AMI"

}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"

}

# variable "availability_zone" {
#   type        = string
#   description = "Project Avaibility Zone"
# }

variable "env" {
  type        = string
  description = "Project Environment"
}

variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}

variable "public_subnet_id" {
  type        = string
  description = "Public Subnet Id"
}

variable "public_key" {
  type        = string
  description = "Dev Public Key"
}
