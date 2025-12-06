output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "frontend_instance_id" {
  value = module.ec2.frontend_instance_id
}

output "frontend_public_ip" {
  value = module.ec2.frontend_public_ip
}

output "backend_instance_id" {
  value = module.ec2.backend_instance_id
}

output "backend_public_ip" {
  value = module.ec2.backend_public_ip
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "sns_topic_arn" {
  value = module.cloudwatch.sns_topic_arn
}
