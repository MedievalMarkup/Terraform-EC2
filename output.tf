output "sg_ids" {
  value = [for sg in module.security_groups : sg.id]
}

output "ami_id" {
  value = data.aws_ami.example.id
}
