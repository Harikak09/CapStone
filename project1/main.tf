resource "aws_vpc" "vpc" {

    cidr_block = "10.0.0.0/16"

    instance_tenancy = "default"



    tags = {

        Name = "vpc-harika"

    }

}



resource "aws_subnet" "subnet"{

    vpc_id = aws_vpc.vpc.id

    cidr_block = "10.0.1.0/24"

    map_public_ip_on_launch = "true"

    tags = {

        Name = "subnet-harika"

    }

}



resource "aws_internet_gateway" "gw"{

    vpc_id = aws_vpc.vpc.id 



    tags = { 

        Name = "gw-harika"

    }  

}



resource "aws_route_table" "rt"{

    vpc_id = aws_vpc.vpc.id 



    route{

        cidr_block = "0.0.0.0/0"

        gateway_id = aws_internet_gateway.gw.id 

    }



    tags = {

        Name = "rt-harika"

    } 

}



resource "aws_route_table_association" "rta"{

    subnet_id = aws_subnet.subnet.id 

    route_table_id = aws_route_table.rt.id 

}



resource "aws_security_group" "sg"{

    name = "sg_harika"

    description = "Allow HTTP and SSH to the web server"

    vpc_id = aws_vpc.vpc.id



    tags = {

        Name = "sg-harika"

    } 



    ingress {

        from_port = 80

        to_port = 80

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }



    ingress {

        from_port = 22

        to_port = 22

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }



    egress {

        from_port = 0

        to_port = 0

        protocol = "-1"

        cidr_blocks = ["0.0.0.0/0"]

    }

}



resource "aws_instance" "ec2" {

      ami = "ami-096f46d460613bed4"

      instance_type = "t2.micro"

      subnet_id = aws_subnet.subnet.id

      vpc_security_group_ids = [aws_security_group.sg.id]

      key_name = var.key_name



      tags = {

        Name = "Web Page-Project1-Harika"

      }



}





output "aws_instance_public_dns" {

  value = aws_instance.ec2.public_dns

}


