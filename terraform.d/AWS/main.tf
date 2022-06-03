provider "aws" {
    access_key  = "AKIAXLX6W2TSZDJE4K54"
    secret_key  = "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"
    region      = "eu-central-1"
}

resource "aws_instance" "Homework" {
    ami           = "ami-dd3c0f36"
    instance_type = "t2.micro"
    key_name      = "terraform"
}
