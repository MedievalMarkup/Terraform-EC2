
#Input Variables

//EC2

variable "aws_region" {
  description = "AWS EC2 region"
  type = string
  default = "us-west-2"
}

variable "aws_ec2_instance_type" {
  description = "AWS EC2 Instance Type"
  type = list(string)
  default = ["t2.micro"]
}

variable "aws_ec2_ami" {
  description = "AWS EC2 Instance AMI"
  type = string
  default = "ami-04e914639d0cca79a"
}

variable "aws_ec2_instance_keypair" {
  description = "AWS EC2 Instance Keypair"
  type = string
  default = "test-key"
  sensitive = true
}

//SecurityGroups

variable "sg_name" {
  description = "Security Group Name"
  type = string
  default = "ec2-sgs"
}

# variable "sg_description" {
#   description = "Security Group description"
#   type = list(string)
#   default = ["Dev VPC SSH", "Dev VPC WEB"]
# }

variable "ing_sg_rules" {
  type = list(object({
    ing_description = string
    ing_from_port   = number
    ing_to_port     = number
    ing_protocol    = string
    ing_cidr_blocks = list(string)
    # ing_ipv6_cidr_blocks = list(string)
    #ing_sg_tags        = string
  }))
  default = [
    {
      ing_description = "ssh traffic"
      ing_from_port   = 22
      ing_to_port     = 22
      ing_protocol    = "tcp"
      ing_cidr_blocks = ["0.0.0.0/0"]
    },
    {
      ing_description = "web traffic"
      ing_from_port   = 80
      ing_to_port     = 80
      ing_protocol    = "http"
      ing_cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "eg_sg_rules" {
  type = list(object({
    eg_description = string
    eg_from_port   = number
    eg_to_port     = number
    eg_protocol    = string
    eg_cidr_blocks = list(string)
    # eg_ipv6_cidr_blocks = list(string)
    #eg_sg_tags        = string
  }))
  default = [
    {
      eg_description = "ssh traffic"
      eg_from_port   = 0
      eg_to_port     = 0
      eg_protocol    = "tcp"
      eg_cidr_blocks = ["0.0.0.0/0"]
      #eg_sg_tags         = "allow ssh"
    },
    {
      eg_description = "web traffic"
      eg_from_port   = 0
      eg_to_port     = 0
      eg_protocol    = "http"
      eg_cidr_blocks = ["0.0.0.0/0"]
      #eg_sg_tags         = "allow http"
    }
  ]
}


# variable "vpc_id" {
#   description = "VPC ID"
#   type = string
#   default = "for testing"  
# }

variable "ec2_user_data" {
  description = "user data for ec2"
  type = string
  default = "./files/app1-install.sh"
}
variable "ec2_key_name" {
  description = "user data for ec2"
  type = string
  default = "./files/test-key.pem"
}

# variable "vpc_security_groups_id" {
#   description = "user data for ec2"
#   type = string
#   default = "./files/test-key.pem"
# }

//AMI

#variable "executable_users" {
#  description = "List of executable users"
#  type        = list(string)
#}

variable "ami_most_recent" {
  description = "Flag to get the most recent AMI"
  type        = bool
  default     = true
}


#variable "ami_name_regex" {
#  description = "Regex pattern for AMI names"
#  type        = string
#  default     = true
#}

variable "ami_owners" {
  description = "List of AMI owners"
  type        = list(string)
  default     = ["amazon"]
}

variable "ami_name_prefix" {
  description = "Prefix for AMI names"
  type        = string
  default     = "amzn2-ami-hvm-*-gp2"
}

variable "ami_root_device_type" {
  description = "Root device type filter"
  type        = string
  default     = "ebs"
}

variable "ami_virtualization_type" {
  description = "Virtualization type filter"
  type        = string
  default     = "hvm"
}

variable "ami_archi_implementaion" {
  description = "archi"
  type        = string
  default     = "x86_64"
}
