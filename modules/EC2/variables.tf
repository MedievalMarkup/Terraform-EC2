variable "aws_ec2_instance_type" {
  description = "AWS EC2 Instance Type"
  type = string
}

variable "aws_ec2_ami" {
  description = "AWS EC2 Instance AMI"
  type = string
}


variable "vpc_security_groups_id" {
  description = "AWS EC2 Instance sgs"
  type = list(string)
}

variable "ec2_user_data" {
  description = "user data for ec2"
  type = string
}
variable "ec2_key_name" {
  description = "key for ec2"
  type = string
}

variable "ec2_av_zone" {
  description = "key for ec2"
  type = string
}
