provider "aws" {
  region     = "${var.region}"
}

data "aws_ami_ids" "ec2-ami" {
  owners  = ["self"]
  sort_ascending = true
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

module "securityGroupModule" {
  source			= "./modules/securityGroup"
	region			= "${var.region}"
	environment_tag = "${var.environment_tag}"
}

module "instanceModule" {
	source 				= "./modules/instance"
 	region     			= "${var.region}"
 	instance_ami		= "${data.aws_ami_ids.ec2-ami.id}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80}"]
	environment_tag 	= "${var.environment_tag}"
}
