## Security Group for ELB
resource "aws_security_group" "elb" {
  name = "terraform-example-elb"
  vpc_id = "${aws_vpc.kas_aws.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a new load balancer

resource "aws_elb" "web-lb" {
  name               = "firewall-enabled-terraform-elb"
  #availability_zones = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  security_groups = ["${aws_security_group.elb.id}"]
  subnets = ["${aws_subnet.web.id}"]

  #access_logs {
  #  bucket        = "foo"
  #  bucket_prefix = "bar"
  #  interval      = 60
  #}

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  #listener {
  #  instance_port      = 8000
  #  instance_protocol  = "http"
  #  lb_port            = 443
  #  lb_protocol        = "https"
  #  ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  #}

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.phpapp.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "phpapp-terraform-elb"
  }
}
