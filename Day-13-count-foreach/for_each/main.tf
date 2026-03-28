variable "ami_id" {
    description = "passing values to ami_id"
    default     = ""
    type        = string
}

variable "instance_type" {
    description = "passing the values to instance_type"
    default     = ""
    type        = string
}
variable "env" {
    description = "environment name"
    default     = ["dev", "test", "prod"]
    type        = list(string)
}
resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    for_each = toset(var.env)
    tags = {
      name = each.key  # so here we can creating 3 instances with different names
    }
  
}