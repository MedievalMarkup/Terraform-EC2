output "sg_ids" {
  value = aws_security_group.vpc_sgs.id
}

//output "sg_ids" {
//  value = toset([for sg_key, sg_value in aws_security_group.vpc_sgs : sg_value.id])
//}

//output "sg_ids" {
//  value = toset(aws_security_group.vpc_sgs[*].id)
//}

//output "sg_ids" {
//  value = aws_security_group.vpc_sgs[*].id
//}
