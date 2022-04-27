
region = "us-east-2"

groups = {
    ronaldoafonso = {
        policy = {
            name = "ronaldoafonso_policy"
            file = "ronaldoafonso.json"
        }
    }
}

users = {
    ronaldo = {
        groups = ["ronaldoafonso"]
    }
}

buckets = [
    "ra-blog-cdn"
]

blog_host_name = "www.ronaldoafonso.com.br"
