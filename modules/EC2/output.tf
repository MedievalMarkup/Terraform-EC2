
//can convert to the value of same type using toset()
output "ec2_public_ip" {
  value = toset([for instance in aws_instance.test-instance-1 : instance.public_ip])
}

//can use tomap() to convert to the map
output "ec2_dns" {
  value = toset([for az in aws_instance.test-instance-1 : az.public_dns])
}
