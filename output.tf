output "sg_ids" {
  value = [for sg in module.security_groups : sg.sg_ids]
}

//output "sg_ids" {
//  value = toset(module.security_groups[*].id)
//}

output "ec2_ips_pub" {
  value = toset([for instance in module.EC2 : instance.public_ip])
  //value = module.EC2.public_ip
}

output "ec2_dns_pub" {
  value = toset([for instance in module.EC2 : instance.public_dns])
  //value = module.EC2.public_dns
}

output "ami_id" {
  value = data.aws_ami.example.id
}
