#variable "executable_users" {
#  description = "List of executable users"
#  type        = list(string)
#}

variable "ami_most_recent" {
  description = "Flag to get the most recent AMI"
  type        = bool
}

#variable "name_regex" {
#  description = "Regex pattern for AMI names"
#  type        = string
#}

variable "ami_owners" {
  description = "List of AMI owners"
  type        = list(string)
}

variable "ami_name_prefix" {
  description = "Prefix for AMI names"
  type        = string
}

variable "ami_root_device_type" {
  description = "Root device type filter"
  type        = string
}

variable "ami_virtualization_type" {
  description = "Virtualization type filter"
  type        = string
}

variable "ami_archi_implementaion" {
  description = "archi"
  type        = string
}
