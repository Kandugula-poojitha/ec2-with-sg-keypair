output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.instance-1.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.instance-1.public_ip
}