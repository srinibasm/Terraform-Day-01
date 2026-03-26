resource "aws_instance" "name" {
    ami = "ami-0b0b78dcacbab728f"
    instance_type = "t2.micro"

    #lifecycle {
     # create_before_destroy = true
    #}
    #lifecycle {
     # ignore_changes = [ tags,instance_type ]
    #}
    lifecycle {
      prevent_destroy = false
    }
    tags = {
        name = "dev-instance"
    }
}
