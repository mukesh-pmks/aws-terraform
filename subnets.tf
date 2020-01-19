# Declare the data source
data "aws_availability_zones" "available" {}

resource "aws_subnet" "web" {

    vpc_id = "${aws_vpc.kas_aws.id}"

    cidr_block = "${var.Subnet-web-CIDR}"

    tags = {

        Name = "web"

    }

#    availability_zone = "${data.aws_availability_zones.available.names[0]}"

}

resource "aws_route_table_association" "web" {

    subnet_id = "${aws_subnet.web.id}"

    route_table_id = "${aws_route_table.public.id}"

}

resource "aws_subnet" "db" {

    vpc_id = "${aws_vpc.kas_aws.id}"

    cidr_block = "${var.Subnet-db-CIDR}"

    tags = {

        Name = "web"

    }

#    availability_zone = "${data.aws_availability_zones.available.names[1]}"

}

resource "aws_route_table_association" "db" {

    subnet_id = "${aws_subnet.db.id}"

    route_table_id = "${aws_route_table.private.id}"

}
