# output "instance_ip_addresses" {
#   value = {
#     for instance in aws_instance.server :
#     instance.id => instance.private_ip
#   }
# }

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}