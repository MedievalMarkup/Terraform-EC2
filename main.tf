# module "ec2_ami" {
#   source = "./modules/ec2_ami_module"
#   # executable_users  = ["self"]
#   ami_most_recent           = var.ami_most_recent
#   # name_regex        = "^myami-\\d{3}"
#   ami_owners                = var.ami_owners
#   ami_name_prefix           = var.ami_name_prefix
#   ami_root_device_type      = var.ami_root_device_type
#   ami_virtualization_type   = var.ami_virtualization_type
#   ami_archi_implementaion   = var.ami_archi_implementaion
# }

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

data "aws_ec2_instance_type_offerings" "chk_az_for_ec2" {
  filter {
    name   = "instance-type"
    //list of strng
    values = var.aws_ec2_instance_type
  }

  filter {
    name   = "location"
    values = [var.var.chk_ec2_loc]
  }

  location_type = var.loc_type
}

data "aws_availability_zones" "az_for_ec2" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


module "security_groups" {
  source             = "./modules/SG"
  count              = length(var.aws_ec2_instance_type)
  sg_name            = var.sg_name
  ing_sg_rules       = var.ing_sg_rules
  eg_sg_rules        = var.eg_sg_rules
}

module "EC2" {
  source                = "./modules/EC2"
  for_each              = toset(var.aws_ec2_instance_type)
  aws_ec2_instance_type = each.key
  aws_ec2_ami           = data.aws_ami.example.id
  ec2_user_data         = var.ec2_user_data
  ec2_key_name          = var.ec2_key_name
  //I was getting error here that id is not available because I was using splat operator on object, so need to use for_each/for
  vpc_security_groups_id = [for sg in module.security_groups : sg.sg_ids]
  //data.aws_availability_zones.az_for_ec2.names this will only provide list, but for for_each we need set
  //now its set of strings & in set of strings: each.key == each.value
  //for_each               = toset(data.aws_availability_zones.az_for_ec2.names)
  ec2_av_zone            = toset(data.aws_availability_zones.az_for_ec2.names)
  # depends_on = [
  #   data.aws_ami.example,
  #   data.aws_availability_zones.az_for_ec2
  # ]
}
