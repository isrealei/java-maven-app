# This section contains all the varaibles needed for provsioning my server

variable "subnet_cidr_block" {
    default = "10.0.1.0/24"
}
variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
}
variable "avail_zone" {
    default = "us-east-1"
}
variable "env_prefix" {
    default = "dev"
}
variable "my_IP" {
    default = "86.169.60.209/32"
}
# variable "PUBKEY_PATH" {}
# variable "PRIVKEY_PATH" {}
variable "instance_type" {
    default = "t2.micro"
}

variable "region" {
  default = "us-east-1"
}
