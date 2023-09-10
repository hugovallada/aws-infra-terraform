resource "aws_network_acl" "network-acl-custom-privada" {
  vpc_id = aws_vpc.vpc-custom.id
  tags = {
    Name = "network-acl-custom-privada"
  }
}

resource "aws_network_acl" "network-acl-custom-publica" {
  vpc_id = aws_vpc.vpc-custom.id
  tags = {
    Name = "network-acl-custom-publica"
  }
}

resource "aws_network_acl_association" "network-acl-association-custom-privada" {
  count          = 2
  subnet_id      = aws_subnet.subnet-custom-private[count.index].id
  network_acl_id = aws_network_acl.network-acl-custom-privada.id
}

resource "aws_network_acl_association" "network-acl-association-custom-publica" {
  count          = 2
  subnet_id      = aws_subnet.subnet-custom-public[count.index].id
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
}

resource "aws_network_acl_rule" "network-acl-rule-custom-publica-22" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  from_port      = 22
  to_port        = 22
  egress         = false
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-publica-80" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  rule_number    = 110
  protocol       = "tcp"
  rule_action    = "allow"
  from_port      = 80
  to_port        = 80
  egress         = false
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "network-acl-rule-custom-publica-443" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  rule_number    = 120
  protocol       = "tcp"
  rule_action    = "allow"
  from_port      = 443
  to_port        = 443
  egress         = false
  cidr_block     = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "network-acl-rule-custom-publica-3389" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  rule_number    = 130
  protocol       = "tcp"
  rule_action    = "allow"
  from_port      = 3389
  to_port        = 3389
  egress         = false
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-publica-outbound" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  egress         = true
  rule_number    = 100
  from_port      = 1024
  to_port        = 65535
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  protocol       = "tcp"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-privada-outbound" {
  network_acl_id = aws_network_acl.network-acl-custom-privada.id
  egress         = false
  rule_number    = 100
  from_port      = 3306
  to_port        = 3306
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-publica-outbound-all" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  egress         = true
  rule_number    = 1000
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  protocol       = "all"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-publica-inbound-all" {
  network_acl_id = aws_network_acl.network-acl-custom-publica.id
  egress         = false
  rule_number    = 1000
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  protocol       = "all"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-privada-outbound-all" {
  network_acl_id = aws_network_acl.network-acl-custom-privada.id
  egress         = true
  rule_number    = 1000
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  protocol       = "all"
}

resource "aws_network_acl_rule" "network-acl-rule-custom-privada-inbound-all" {
  network_acl_id = aws_network_acl.network-acl-custom-privada.id
  egress         = false
  rule_number    = 1000
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  protocol       = "all"
}





