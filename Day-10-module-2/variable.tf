variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "key_name" {}

variable "public_ip" {
  default = true
}

variable "root_volume_size" {
  default = 10
}

variable "enable_monitoring" {
  default = false
}

variable "tags" {
  type = map(string)
}