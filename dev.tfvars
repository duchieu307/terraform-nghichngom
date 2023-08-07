#Region
region = "ap-southeast-1"

#Key
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCpR0A64S/R9F/ilcu/WFQwXBpLZ7k5k9V7NGagFmqLMy2d25ZvEDFEeKi/lnqdRdp1fw0gMHmHlNToQ9xOccIE2lHSPK5tWe8aWgkxByTECpT//xPUiStYXA+5CHnYbigqRDzAuw/WrzFTbprxgbygr10QjGU5RScdeJPKXbofaZiKPCGTU4I65j86lMcV5JSP5YY2kRQdGsH/bBj0sJoZ782tfqfkvg0a3Chp3v5o2ELm4BZqzg4s4oKF5A4fh17qT02IP+SWCJ9+vW1Chw9gecJT7j3/6sVUx+XKM2q4S4UjOqfitHqeTgVkeGMz5XT4PzanNfiD2hIcXu9/FqUrF+Pf8FqRGeHKTp/OxakNg8E6X9cQU42Bpe/xYvXOca2r5b1vVuCsgjUIwk5v792D1H/b+lfnNoJ72Jrp4YCboFYsZpSM827kGFi8ocOfD7vtYapU/Efwo4VVZ+TBGgFpR2bcHJ5tyV4IPVfm2GxwHGlmcYkta9soYXgQ8Btqq3aD78Gg4D5QoL0YOUjd37dWDkrUJYD1Emx2JmFZWEGWmj1JjD0jZwPPE8Q+P7BkcyLV2QR05FVmKclWVaOZ7Hcn16m3uSJAnTCj279XOlxcXn8z0DaRx0BjKrqVSUUYFGlGZIqJF2H2iVKOpOtjYZXNbp5YgxtkPIq1HQ0ey9xKLQ== duchieu307@gmail.com"

#Project
env          = "dev"
project_name = "project-vjp"

#Network
vpc_cidr_block    = "10.0.0.0/16"
availability_zone = "ap-southeast-1a"
public_subnet_numbers = {
  ap-southeast-1a = 1
  ap-southeast-1b = 2
}

private_subnet_numbers = {
  ap-southeast-1a = 3
  ap-southeast-1b = 4
}


#EC2
ec2_ami           = "ami-0a481e6d13af82399"
ec2_instance_type = "t2.micro"

#Database
db_allocated_storage    = 10
db_name                 = "mydb"
db_engine               = "mysql"
db_engine_version       = "8.0.33"
db_instance_class       = "db.t2.micro"
db_username             = "foo"
db_password             = "foobarbaz"
db_parameter_group_name = "default.mysql8.0"
db_port                 = 3306

#Cache
cache_cluster_id           = "redis-cluster"
cache_engine               = "redis"
cache_node_type            = "cache.t2.micro"
cache_num_cache_nodes      = 1
cache_parameter_group_name = "default.redis7"
cache_engine_version       = "7.0"
cache_port                 = 6379
