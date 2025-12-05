# Public subnets for EC2 instances that require internet access
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "public"
  }
}

# Private subnets for RDS or backend resources that must not be exposed publicly
resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidr[count.index]
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.environment}-private-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "private"
  }
}

moved {
  from = aws_subnet.public
  to   = aws_subnet.public[0]
}

moved {
  from = aws_subnet.private
  to   = aws_subnet.private[0]
}
