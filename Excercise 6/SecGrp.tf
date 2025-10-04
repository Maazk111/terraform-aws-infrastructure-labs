# Excercise 2 - Create a Security Group
resource "aws_security_group" "dove-sg" {
  name        = "dove-sg"
  description = "dove-sg"

  tags = {
    Name = "dove-sg"
  }
}

# Rule to allow SSH traffic from my IP
resource "aws_security_group_rule" "SSH_from_my_IP" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["202.47.37.103/32"]
  security_group_id = aws_security_group.dove-sg.id
}

# Rule to allow HTTP traffic from anywhere
resource "aws_security_group_rule" "allow_HTTP" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dove-sg.id
}

# Rule to allow all outbound IPv4 traffic
resource "aws_security_group_rule" "allow_all_outbound_IPv4" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # semantically equivalent to all ports
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dove-sg.id
}

# Rule to allow all outbound IPv6 traffic
resource "aws_security_group_rule" "allow_all_outbound_IPv6" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # semantically equivalent to all ports
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.dove-sg.id
}