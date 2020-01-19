
# Create a VPC
resource "aws_vpc" "kas_aws" {
  cidr_block = "${var.vpc-fullcidr}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
      Name = "KAS vpc"
      }
}
