variable "region" {
    type = string
}

variable "VPC_CIDR" {
    type = string
    default = "value"
}

variable "COMPANY_NAME" {
    type = string
}

variable "public_subnet1_cidr" {
    type = string
}

variable "private_subnet1_cidr" {
    type = string
}

variable "public_subnet2_cidr" {
    type = string
}


variable "private_subnet2_cidr" {
    type = string
}


variable "ALL_ROUTE_IP4" {
    type = string
    default = "0.0.0.0/0"
}   

variable "ALL_ROUTE_IP6" {
    type = string
     default ="::/0"

}

variable "SSH_PORT" {
    type = string
     default = "22"

}

variable "Private_PORT" {
    type = string
     default = "3000"

}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

