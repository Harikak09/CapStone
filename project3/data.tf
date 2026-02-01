data "aws_vpc" "existing" {

  default = false

}

data "aws_subnets" "existing" {

  filter {

    name   = "vpc-id"

    values = [data.aws_vpc.existing.id]

  }

}
