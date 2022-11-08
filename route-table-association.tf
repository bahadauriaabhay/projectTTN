resource "aws_route_table_association" "public_subnet_asso" {
  for_each       = var.az-private
  subnet_id      = each.value
  route_table_id = aws_route_table.second_rt.id
}
