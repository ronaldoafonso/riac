
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
