resource "aws_security_group" "sg" {
  name = "security-group"
  vpc_id = aws_vpc.corporate_vpc.id
  ingress{
    description = "allows SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  ingress{
    description = "for http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  ingress {
    description = "for jenkins"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
  }
  ingress {
    description = "for https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }
  egress{
    description = "all traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}