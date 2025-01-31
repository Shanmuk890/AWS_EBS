resource "aws_ebs_volume" "ebs-multi" {
  availability_zone = "us-east-1a"
  encrypted = true
  type = "io2"
  final_snapshot = true
  size              = 4   
  iops              = 3000         
  tags = {
    Name = "ebs_for_multiattach"
  }
}
