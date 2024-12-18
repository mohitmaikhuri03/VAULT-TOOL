output "public_instance_dns" {
  value = module.compute.public_instance_dns
}

output "vault_instance_dns" {
  value = module.compute.vault_instance_dns
}

output "consul_instances_dns" {
  value = module.compute.consul_instances_dns
}

output "vault_lb_dns" {
  value = module.loadbalancer.vault_lb_dns
}
