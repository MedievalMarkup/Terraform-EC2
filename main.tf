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


module "security_groups" {
  source             = "./modules/SG"
  count              = length(var.aws_ec2_instance_type)
  sg_name            = var.sg_name
  ing_sg_rules       = var.ing_sg_rules
  eg_sg_rules        = var.eg_sg_rules
}

module "EC2" {
  source                = "./modules/EC2"
  count                 = length(var.aws_ec2_instance_type)
  aws_ec2_instance_type = var.aws_ec2_instance_type[count.index]
  aws_ec2_ami           = data.aws_ami.example.id
  ec2_user_data         = var.ec2_user_data
  ec2_key_name          = var.ec2_key_name
  vpc_security_groups_id = [for sg in module.security_groups : sg.id]
  # depends_on = [
  #   module.ec2_ami
  # ]
}
