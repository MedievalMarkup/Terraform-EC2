resource "aws_instance" "test-instance-1" {
  instance_type = var.aws_ec2_instance_type
  ami = var.aws_ec2_ami
  vpc_security_group_ids = var.vpc_security_groups_id
  user_data = var.ec2_user_data
  key_name = var.ec2_key_name
}
