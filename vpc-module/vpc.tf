resource "aws_vpc" "vpc-custom" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true
  tags = {
    Name = "vpc-custom"
  }
}
