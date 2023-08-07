resource "aws_security_group" "sg_db" {
  name        = "${var.env}-${var.project_name}-sg-db"
  description = "SG for db"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "sg_rule_db" {
  type                     = "ingress"
  from_port                = var.db_port
  to_port                  = var.db_port
  protocol                 = "TCP"
  source_security_group_id = var.ec2_sg
  security_group_id        = aws_security_group.sg_db.id
}

resource "aws_db_instance" "database" {
  allocated_storage      = var.db_allocated_storage
  db_name                = var.db_name
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.db_parameter_group_name
  skip_final_snapshot    = true
  availability_zone      = var.availability_zone
  port                   = var.db_port
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_db.id]

}


resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.env}-${var.project_name}"
  subnet_ids = var.private_subnet_ids
}


