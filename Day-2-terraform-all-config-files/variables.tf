variable "ami_id" {
    description = "passing values to ami_id"
    default = "ami-0b0b78dcacbab728f"
    type = string
}
variable "instance_type" {
    description = "passing the values to instance_type"
    default = "t2.micro"
    type = string
}