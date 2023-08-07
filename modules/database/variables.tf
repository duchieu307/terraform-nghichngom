variable "db_allocated_storage" {
  type        = number
  description = "Database Allocated Storage"
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


variable "env" {
  type        = string
  description = "Project Environment"
}

variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "private_subnet_ids" {
  type = list(any)
}

variable "availability_zone" {
  type        = string
  description = "Project Avaibility Zone"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}

variable "db_port" {
  type        = number
  description = "Database Port"
}

variable "ec2_sg" {
  type        = string
  description = "EC2 SG ID"
}
