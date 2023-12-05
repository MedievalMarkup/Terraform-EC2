variable "chk_ec2_loc" {
  description = "location"
  type        = list(string)
  default     = ["us-west-2"]
}

variable "loc_type" {
  description = "location type"
  type        = string
  default     = "availability-zone"  
}

variable "aws_ec2_instance_type" {
  description = "AWS EC2 Instance Type"
  type = list(string)
  default = ["t2.micro"]
}
