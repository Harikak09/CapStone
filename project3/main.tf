resource "aws_instance" "project3-cpu-test" {
  ami = "ami-0ff5003538b60d5ec"
  instance_type = "t3.micro"
  
  key_name = "harika_terraform"
  subnet_id              = data.aws_subnets.existing.ids[0]

  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  tags = {
    Name = "project3-ec2-state-monitoring-alarm-harika"
  }
}
