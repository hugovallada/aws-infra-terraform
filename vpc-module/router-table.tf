resource "aws_route_table" "route_table_custom_public" {
  vpc_id = aws_vpc.vpc-custom.id
  tags = {
    Name = "route-table-custom-public"
  }
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-custom.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.internet-gateway-custom.id
  }
}

// create a private route table
resource "aws_route_table" "route_table_custom_private" {
  vpc_id = aws_vpc.vpc-custom.id
  tags = {
    Name = "route-table-custom-private"
  }
}

// associate route table to subnets
resource "aws_route_table_association" "route_table_association_custom_public" {
  count          = 2
  subnet_id      = aws_subnet.subnet-custom-public[count.index].id
  route_table_id = aws_route_table.route_table_custom_public.id
}

// associate route table to subnets private
resource "aws_route_table_association" "route_table_association_custom_private" {
  count          = 2
  subnet_id      = aws_subnet.subnet-custom-private[count.index].id
  route_table_id = aws_route_table.route_table_custom_private.id
}


