output "instance_public_ip" {
  description = "instance public ip"
  value       = aws_instance.my_terratest.public_ip
}

output "instance_public_dns" {
  description = "instance public dns"
  value       = aws_instance.my_terratest.public_dns
}

output "instance_arn" {
  description = "created ec2 arn"
  value       = aws_instance.my_terratest.arn
}