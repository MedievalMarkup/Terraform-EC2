data "aws_ami" "example" {
  # executable_users = var.executable_users
  most_recent      = var.ami_most_recent
  # name_regex       = var.name_regex
  owners           = var.ami_owners
  filter {
    name   = "name"
    values = ["${var.ami_name_prefix}"]
  }
  #simple search filter
  filter {
    name   = "root-device-type"
    values = ["${var.ami_root_device_type}"]
  }
  filter {
    name   = "virtualization-type"
    values = ["${var.ami_virtualization_type}"]
  }
  filter {
    name   = "architecture"
    values = ["${var.ami_archi_implementaion}"]
  }
}






//to make the below working fully dynamic - taking help from av datasource
data "aws_availability_zones" "az_for_ec2" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}




data "aws_ec2_instance_type_offerings" "chk_az_for_ec2" {
  //for_each = toset(var.chk_ec2_loc)
  for_each = toset(data.aws_availability_zones.az_for_ec2.names)
  filter {
    name   = "instance-type"
    //list of strng
    values = [var.aws_ec2_instance_type]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = var.loc_type
}
