
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "subnets" {
    for_each = var.vpc_subnets
    vpc_id = aws_vpc.vpc.id
    cidr_block = each.value.cidr_block
    tags = {
        Name = each.value.name
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = var.igw_name
    }
}

resource "aws_route_table" "route_tables" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "ra-public-route-table"
    }
}

resource "aws_route_table_association" "route_table_associations" {
    subnet_id = aws_subnet.subnets["public"].id
    route_table_id = aws_route_table.route_tables.id
}

resource "aws_security_group" "ssh_security_group" {
    name = "ssh_security_group"
    description = "Allow SSH inbound traffic"
    vpc_id = aws_vpc.vpc.id
    ingress {
        description = "SSH from VPC"
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
    tags = {
        Name = "allow-ssh"
    }
}
