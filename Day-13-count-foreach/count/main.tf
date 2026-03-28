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

# Use case 1: Same env, multiple instances
#resource "aws_instance" "dev" {
   # ami           = var.ami_id
   # instance_type = var.instance_type
   # count         = 2

    #tags = {
      #  Name = "dev-instance-${count.index}"
    #}
#}

# Use case 2: Different names (dev, test, prod)
resource "aws_instance" "name" {
    ami           = var.ami_id
    instance_type = var.instance_type
    count         = length(var.env)

    tags = {
        Name = var.env[count.index]
    }
}