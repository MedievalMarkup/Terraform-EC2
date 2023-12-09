
//can convert to the value of same type using toset()
output "ec2_public_ip" {
  //value = toset([for az in aws_instance.test-instance-1 : az.public_ip])
  value = aws_instance.test-instance-1.public_ip
}


output "ec2_dns" {
  value = aws_instance.test-instance-1.public_dns
}
