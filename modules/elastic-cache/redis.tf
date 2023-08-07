resource "aws_security_group" "sg_redis" {
  name        = "${var.env}-${var.project_name}-sg-redis"
  description = "SG for Redis"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "sg_rule_redis" {
  type                     = "ingress"
  from_port                = var.cache_port
  to_port                  = var.cache_port
  protocol                 = "TCP"
  source_security_group_id = var.ec2_sg
  security_group_id        = aws_security_group.sg_redis.id
}

resource "aws_elasticache_subnet_group" "cache_subnet_group" {
  name       = "${var.env}-${var.project_name}"
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  availability_zone    = var.availability_zone
  cluster_id           = var.cache_cluster_id
  num_cache_nodes      = var.cache_num_cache_nodes
  engine               = var.cache_engine
  node_type            = var.cache_node_type
  parameter_group_name = var.cache_parameter_group_name
  engine_version       = var.cache_engine_version
  port                 = var.cache_port
  subnet_group_name    = aws_elasticache_subnet_group.cache_subnet_group.name
  security_group_ids   = [aws_security_group.sg_redis.id]
}

