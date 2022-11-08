

#keypair
resource "tls_private_key" "pem" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.pem.public_key_openssh
}

#elastic ip
resource "aws_eip" "nateIP" {
  vpc = true
}


resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.nateIP.id
  for_each      = var.az-public
  subnet_id     = each.value
}

