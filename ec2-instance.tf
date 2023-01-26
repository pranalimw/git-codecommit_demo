resource "aws_instance" "ojt-ec2-instance" {
  ami           = "ami-0ceecbb0f30a902a6"
  instance_type = "t2.micro"
  # VPC
  subnet_id = aws_subnet.public_subnet.id
  # SG
  vpc_security_group_ids = ["${aws_security_group.mySG.id}"]
  # keypair
  key_name  = "ojt_key"
  user_data = file("user_data.sh")
  tags = {
    Name = "ojt-instance"
  }
}
