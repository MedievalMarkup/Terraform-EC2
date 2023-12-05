data "aws_ec2_instance_type_offerings" "chk_az_for_ec2" {
  filter {
    name   = "instance-type"
    //list of strng
    values = var.aws_ec2_instance_type
  }

  filter {
    name   = "location"
    values = var.chk_ec2_loc
  }

  location_type = [var.loc_type]
}
