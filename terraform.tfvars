
region = "us-east-2"

groups = {
    ronaldoafonso = {
        policy = {
            name = "ronaldoafonso_policy"
            file = "ronaldoafonso.json"
        }
    }
    z3n = {
        policy = {
            name = "z3n_policy"
            file = "z3n.json"
        }
    }
}

users = {
    ronaldo = {
        groups = ["ronaldoafonso"]
    }
    z3n = {
        groups = ["z3n"]
    }
}

buckets = [
    "ra-blog-cdn"
]

blog_host_name = "www.ronaldoafonso.com.br"

vpc_name = "ra-vpc"

vpc_cidr_block = "10.0.0.0/16"

vpc_subnets = {
    public = {
        name = "ra-public-subnet"
        cidr_block = "10.0.1.0/24"
    }
    private = {
        name = "ra-private-subnet"
        cidr_block = "10.0.2.0/24"
    }
}

igw_name = "ra-igw"
