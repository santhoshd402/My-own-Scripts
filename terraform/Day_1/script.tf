provider "aws" {
access_key    = "AKIAZ5V4YWJV7HDBR7UX"
secret_key    = "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"
region        = "us-west-2"    
}
resource "aws_instance" "web" {
instance_type    = "t2.micro"
ami              = "ami-06f2f779464715dc5"
  
}

