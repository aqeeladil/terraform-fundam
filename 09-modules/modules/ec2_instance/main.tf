
resource "aws_instance" "example" {
    ami_value = var.ami_value
    instance_type = var.instance_type
    subnet_id = var.subnet_id
}