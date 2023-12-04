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
