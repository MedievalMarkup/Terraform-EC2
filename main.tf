module "security_groups" {
  source             = "./modules/SG"
  count              = length(var.aws_ec2_instance_type)
  sg_name            = var.sg_name
  ing_sg_rules       = var.ing_sg_rules
  eg_sg_rules        = var.eg_sg_rules
}

module "EC2" {
  source                = "./modules/EC2"
  //for_each              = toset(var.aws_ec2_instance_type)
  aws_ec2_instance_type = var.aws_ec2_instance_type
  aws_ec2_ami           = data.aws_ami.example.id
  ec2_user_data         = var.ec2_user_data
  ec2_key_name          = var.ec2_key_name
  //I was getting error here that id is not available because I was using splat operator on object, so need to use for_each/for
  vpc_security_groups_id = [for sg in module.security_groups : sg.sg_ids]
  //data.aws_availability_zones.az_for_ec2.names this will only provide list, but for for_each we need set
  //now its set of strings & in set of strings: each.key == each.value
  //for_each               = toset(data.aws_availability_zones.az_for_ec2.names)
  //ec2_av_zone            = keys(data.aws_ec2_instance_type_offerings.chk_az_for_ec2)
  for_each              =  toset(keys({
     for az, details in data.aws_ec2_instance_type_offerings.chk_az_for_ec2:
     az => details.instance_types if length(details.instance_types) != 0
  }))
  ec2_av_zone           = each.key
  # depends_on = [
  #   data.aws_ami.example,
  #   data.aws_availability_zones.az_for_ec2
  # ]
}
