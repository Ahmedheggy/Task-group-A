# Public route table to allow internet access through the Internet Gateway

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-public-rt"
    Environment = var.environment
    Tier        = "public"
  }
}

# Default route for public subnet: all outbound traffic goes through IGW

resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate the public subnet with its route table

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
