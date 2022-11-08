
###subnet
resource "aws_subnet" "mysubnetpub" {
  for_each   = var.az-public
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = cidrsubnet(aws_vpc.myvpc.cidr_block, 4, each.value)
  tags = {
    Name = "mysubnet-public ${each.value + 1}"
  }
}

resource "aws_subnet" "mysubnetpvt" {
  for_each   = var.az-private
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = cidrsubnet(aws_vpc.myvpc.cidr_block, 4, each.value)
  tags = {
    Name = "mysubnet-pvt c"
  }
}
