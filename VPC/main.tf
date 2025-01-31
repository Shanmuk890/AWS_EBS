resource "aws_vpc" "myvpc" {
  cidr_block = ""

}

resource "aws_subnet" "pub_subnet" {
  vpc_id = ""
  cidr_block = ""
}

resource "aws_subnet" "pvt_subnet" {
  vpc_id = ""
  cidr_block = ""
}

resource "aws_route_table" "pub_rt" {
  vpc_id = ""
  route {
    cidr_block = ""
    
  }
}