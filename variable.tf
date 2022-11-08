variable "az-public" {
  type        = map(number)
  description = "az for public subnet"
  default = {
    "ap-south-1a" = 1
    "ap-south-1b" = 2
    "ap-south-1c" = 3
  }

}

variable "az-private" {
  type        = map(number)
  description = "az for pvt subnet"
  default = {
    "ap-south-1a" = 4
    "ap-south-1b" = 5
    "ap-south-1c" = 6
  }
}

variable "cidr_block" {
  type        = string
  description = "ip to be alloted"
  default     = "10.0.0.0/16"
}

variable "instances" {
  description = "number of ec2 instances"
  default     = 2
}
# variable "ami" {
#   type        = string
#   description = "ami for ubuntu "
#   default     = "ami-0f2e255ec956ade7f"
# }

variable "key_name" {}

variable "ports" {
  type = list
}