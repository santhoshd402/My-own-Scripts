variable "accesskey" {
    type        = "string"  
}

variable "secretkey" {
    type        = "string"  
}

variable "region" {
    type        = "string"
    default     = "eu-west-3"
}

variable "ami-id" {
    type        = "string"
    default     = "ami-0ad37dbbe571ce2a1"
  
}

variable "awskeypair" {
    type    = "string"
    default = "parispem"
  
}

variable "sshusername" {
    type    = "string"
    default = "ubuntu"
  
}

variable "sshkeypath" {
    type    = "string"
    default = "./parispem.pem"
  
}

