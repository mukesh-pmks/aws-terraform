resource "aws_instance" "phpapp" {
  ami = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.web.id}"
  vpc_security_group_ids = ["${aws_security_group.WebApp.id}"]
  key_name = "${var.key_name}"
  user_data = "${file("scripts/webapp.sh")}"
  tags = {
    Name = "My Web App"
  }

}

resource "aws_instance" "database" {
  ami = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.db.id}"
  vpc_security_group_ids = ["${aws_security_group.MySQLDB.id}"]
  key_name = "${var.key_name}"
  user_data = "${file("scripts/db.sh")}"
  tags = {
    Name = "sql database"
  }
}
