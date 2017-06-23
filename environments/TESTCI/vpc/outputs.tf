output "aws_vpc.vpc.id" {
  description = "aws id of VPC"
  value = "${module.vpc.aws_vpc.vpc.id}"
}

output "aws_vpc.vpc.name" {
  description = "name of VPC"
  value = "${module.vpc.aws_vpc.vpc.name}"
}

output "aws_vpc.vpc.cidr" {
  description = "cidr block of VPC"
  value = "${module.vpc.aws_vpc.vpc.cidr}"
}

output "aws_subnet.internal_subnet.*.id" {
  description = "list of internal subnet ids"
  value = ["${module.vpc.aws_subnet.internal_subnet.*.id}"]
}

output "aws_subnet.internal_subnet.*.cidr_block" {
  description = "list containing internal cidr blocks"
  value = ["${module.vpc.aws_subnet.internal_subnet.*.cidr_block}"]
}

output "aws_subnet.external_subnet.*.id" {
  description = "list of external subnet ids"
  value = ["${module.vpc.aws_subnet.external_subnet.*.id}"]
}

output "aws_subnet.external_subnet.*.cidr_block" {
  description = "list containing external cidr blocks"
  value = ["${module.vpc.aws_subnet.external_subnet.*.cidr_block}"]
}
