variable "region" {
    default = "ap-southeast-1a"
}

variable "AmiLinux" {
type = map
    default = {
      ap-southeast-1a = "ami-0b4dd9d65556cac22"
      ap-southeast-1b = "ami-0b4dd9d65556cac22"
      ap-southeast-1c = "ami-0b4dd9d65556cac22"
    }
}

variable "aws_access_key" {
    default = ""
    description = "user aws access key"
}

variable "aws_secret_key" {
    default = ""
    description = " user aws secret key"
}

variable "vpc-fullcidr" {
    default = "172.16.0.0/16"
    description = "the vpc cdir"
}

variable "Subnet-web-CIDR" {
    default = "172.16.0.0/24"
    description = "the cidr of the subnet"
}

variable "Subnet-db-CIDR" {
    default = "172.16.3.0/24"
    description = "the cidr of the subnet"
}

variable "key_name" {
    default = "test2"
    description = "the ssh key to use in the EC2 machines"
}

variable "DnsZoneName" {
     default = "mukeshtest.internal"
     description = "the internal dns name"
}
