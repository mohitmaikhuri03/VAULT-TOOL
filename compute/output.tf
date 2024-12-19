output "public_instance_dns" {
  value = aws_instance.public_instance.public_dns
}

output "vault_instance_dns" {
  value = aws_instance.vault.private_dns
}

output "vault_instance_id" {
  value = aws_instance.vault.id
}
##added 
output "consul_instance_id" {
  value = aws_instance.consul.id
}
output "consul_instances_dns" {
  value = aws_instance.consul.*.private_dns
}
