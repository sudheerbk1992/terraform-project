resource "aws_elb" "bar" {
  name               = "sudheer-terraform-elb"
  availability_zones = ["ap-south-2a", "ap-south-2b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                 = ["${aws_instance.one.id}", "${aws_instance.two.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {
    Name = "hydkeys-tf-elb"
  }
}

 /*resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  availability_zones      = ["ap-south-2a", "ap-south-2b"]
  database_name           = "mydb"
  master_username         = "sudheer"
  master_password         = "bks#444555"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}*/

/*resource "aws_instance" "one" {
  for_each = toset(["one", "two", "three"])
  ami           = "ami-08a3be10cebd4f6aa"
  instance_type = "t2.micro"
  tags = {
    Name = "instance-${each.key}"
  }
}
*/
