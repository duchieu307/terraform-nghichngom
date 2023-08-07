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

variable "availability_zone" {
  type        = string
  description = "Project Avaibility Zone"
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

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}



variable "ec2_sg" {
  type        = string
  description = "EC2 SG ID"
}
