# resource "aws_subnet" "subnet-custom-public-01" {
#   vpc_id            = aws_vpc.vpc-custom.id
#   availability_zone = "sa-east-1a"
#   cidr_block        = "10.0.1.0/24"
#   tags = {
#     Name = "subnet-custom-public-01"
#   }
# }

# resource "aws_subnet" "subnet-custom-public-02" {
#   vpc_id            = aws_vpc.vpc-custom.id
#   availability_zone = "sa-east-1b"
#   cidr_block        = "10.0.2.0/24"
#   tags = {
#     Name = "subnet-custom-public-02"
#   }
# }

// create both subnets above with for each
resource "aws_subnet" "subnet-custom-public" {
  count             = 2
  vpc_id            = aws_vpc.vpc-custom.id
  availability_zone = "sa-east-1${element(["a", "b"], count.index)}"
  cidr_block        = "10.0.${count.index + 1}.0/24"
  tags = {
    Name = "subnet-custom-public-${count.index + 1}"
  }
}

# resource "aws_subnet" "subnet-custom-private-01" {
#   vpc_id            = aws_vpc.vpc-custom.id
#   availability_zone = "sa-east-1a"
#   cidr_block        = "10.0.3.0/24"
#     tags = {
#     Name = "subnet-custom-private-01"
#     }
# }

# resource "aws_subnet" "subnet-custom-private-02" {
#   vpc_id            = aws_vpc.vpc-custom.id
#   availability_zone = "sa-east-1b"
#   cidr_block        = "10.0.4.0/24"
#     tags = {
#     Name = "subnet-custom-private-02"
#     }
# }

// create both private subnets above with for each
resource "aws_subnet" "subnet-custom-private" {
  count             = 2
  vpc_id            = aws_vpc.vpc-custom.id
  availability_zone = "sa-east-1${element(["a", "b"], count.index)}"
  cidr_block        = "10.0.${count.index + 3}.0/24"
  tags = {
    Name = "subnet-custom-private-${count.index + 1}"
  }
}
