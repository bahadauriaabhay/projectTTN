#ec2 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "frontend" {
  for_each      = var.az-public
  ami           = var.data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = each.value
  key_name      = aws_key_pair.generated_key.key_name
    vpc_security_group_ids = ["${aws_security_group.allow_web_traffic.id}"]
     user_data = <<HEREDOC
#!/bin/bash -ex

HEREDOC
  
}
resource "aws_instance" "backend" {
  for_each      = var.az-private
  ami           = var.data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = each.value
  key_name      = aws_key_pair.generated_key.key_name
}



