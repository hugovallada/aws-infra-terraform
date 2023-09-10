resource "aws_internet_gateway" "internet-gateway-custom" {
  vpc_id = aws_vpc.vpc-custom.id
  tags = {
    Name = "internet-gateway-custom"
  }
}
