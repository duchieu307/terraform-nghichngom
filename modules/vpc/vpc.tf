resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.env}-${var.project_name}"
  }
}


resource "aws_subnet" "public-subnets" {
  for_each = var.public_subnet_numbers

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key

  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, each.value)

  tags = {
    Name   = "${var.env}-${var.project_name}-public-subnet"
    Role   = "public"
    Subnet = "${each.key}-${each.value}"
  }
}

resource "aws_subnet" "private-subnets" {
  for_each = var.private_subnet_numbers

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key

  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, each.value)

  tags = {
    Name   = "${var.env}-${var.project_name}-private-subnet"
    Role   = "private"
    Subnet = "${each.key}-${each.value}"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-${var.project_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-${var.project_name}"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public-subnets
  subnet_id      = aws_subnet.public-subnets[each.key].id
  route_table_id = aws_route_table.public.id
}

# resource "aws_route_table_association" "public_subnet_asso" {
#   count          = length(var.public_subnet_cidrs)
#   subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
#   route_table_id = aws_route_table.second_rt.id
# }
