provider "aws" {
    # You can Configure Provider Here But Now It's configured By Environement Variables
    ####################################################################################
    #access_key  = "< define here >"
    #secret_key  = "< define here >"
    #region      = "< define here >"
}

resource "aws_instance" "VM_Homework" {
    # CentOS Linux 7 x86_64 HVM EBS ENA 1805_01
    ami           = "ami-dd3c0f36"
    instance_type = "t2.micro"
    key_name      = "terraform-key"
}

output "public_ip" {
    value   = aws_instance.VM_Homework.public_ip
}

output "public_dns" {
    value   = aws_instance.VM_Homework.public_dns
}
