output "chk_av_ec2_type" {
  value = data.aws_ec2_instance_type_offerings.chk_az_for_ec2.instance_types
}
