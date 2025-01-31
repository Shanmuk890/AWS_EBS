resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/24"

}

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.myvpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/25"
  tags = {
    name = "public-subnet"
  }
}

resource "aws_subnet" "pvt_subnet" {
  vpc_id = aws_vpc.myvpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.128/25"
  tags = {
    name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    name = "igw"
  }
}
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    name = "RT-PublicSubnet"
  }
}

resource "aws_eip" "elasticIP" {
  
}

resource "aws_nat_gateway" "nat-gate" {
  subnet_id = aws_subnet.pvt_subnet.id
  allocation_id = aws_eip.elasticIP.id
}

resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.myvpc.id
  route = {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gate.id
  }
  tags = {
    name = "RT-PrivateSubnet"
  }
}

resource "aws_route_table_association" "pub-asso" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pvt-asso" {
  subnet_id = aws_subnet.pvt_subnet.id
  route_table_id = aws_route_table.pvt_rt.id
}

