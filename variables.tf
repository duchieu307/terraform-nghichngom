variable "region" {
  type        = string
  description = "Project Region"
}

variable "availability_zone" {
  type        = string
  description = "Project Avaibility Zone"
}

variable "public_key" {
  type        = string
  description = "Dev Public Key"
}

variable "env" {
  type        = string
  description = "Project Environment"
}

variable "project_name" {
  type        = string
  description = "Project Name"

}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"

}

variable "public_subnet_numbers" {
  type        = map(number)
  description = "Map of AZ to a number that should be used for public subnets"
}

variable "private_subnet_numbers" {
  type        = map(number)
  description = "Map of AZ to a number that should be used for private subnets"
}

variable "ec2_ami" {
  type        = string
  description = "EC2 AMI"

}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "db_allocated_storage" {
  type        = number
  description = "DB Allocated Storage"
}

variable "db_name" {
  type        = string
  description = "Database Name"
}

variable "db_engine" {
  type        = string
  description = "Database Engine"
}

variable "db_engine_version" {
  type        = string
  description = "Database Engine Version"
}

variable "db_instance_class" {
  type        = string
  description = "Database Instance Class"
}

variable "db_username" {
  type        = string
  description = "Database Username"
}

variable "db_password" {
  type        = string
  description = "Database Password"
}

variable "db_parameter_group_name" {
  type        = string
  description = "Database Parameter Group Name"
}

variable "db_port" {
  type        = number
  description = "Database Port"
}

variable "cache_cluster_id" {
  type        = string
  description = "Cache Cluster Id"
}

variable "cache_engine" {
  type        = string
  description = "Cache Engine"
}

variable "cache_node_type" {
  type        = string
  description = "Cache Node Type"
}

variable "cache_num_cache_nodes" {
  type        = number
  description = "Cache Number Cache Nodes"
}

variable "cache_parameter_group_name" {
  type        = string
  description = "Cache Parameter Group Name"
}

variable "cache_engine_version" {
  type        = string
  description = "Cache Engine Version"
}

variable "cache_port" {
  type        = number
  description = "Cache Port"
}

# variable "private_subnet_id" {
#   type        = string
#   description = "Private Subnet Id"

# }

