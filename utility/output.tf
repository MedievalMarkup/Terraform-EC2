
//first two output values are semi-dynamic version (manually adding the array of locations)

output "chk_av_ec2_type" {
  //value = data.aws_ec2_instance_type_offerings.chk_az_for_ec2.instance_types
  value = [for t in data.aws_ec2_instance_type_offerings.chk_az_for_ec2: t.instance_types]
}

output "get_av_ec2_type" {
  value = {
     for az, details in data.aws_ec2_instance_type_offerings.chk_az_for_ec2: az => details.instance_types
  }
}


//fully dynamic - getting from datasource, see main.tf

//all azs mapped to supported instance type
output "av_mapp_ec2_type" {
  value = {
     for az, details in data.aws_ec2_instance_type_offerings.chk_az_for_ec2: az => details.instance_types
  }
}

//exclude unsupported azs
output "av_mapp_ec2_type_exc" {
  value = {
     for az, details in data.aws_ec2_instance_type_offerings.chk_az_for_ec2: 
     az => details.instance_types if length(details.instance_types) != 0
  }
}

//exclude instances, only get keys that's mean location only
output "av_mapp_ec2_type_exc_ec2_type" {
  value = keys({
     for az, details in data.aws_ec2_instance_type_offerings.chk_az_for_ec2:
     az => details.instance_types if length(details.instance_types) != 0
  })
}
