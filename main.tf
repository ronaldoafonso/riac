
resource "aws_iam_group" "groups" {
    for_each = var.groups
    name = each.key
}

resource "aws_iam_group_policy" "group_policies" {
    for_each = var.groups
    group = each.key
    name  = each.value.policy.name
    policy = file("${path.root}/policies/${each.value.policy.file}") 
}

resource "aws_iam_user" "users" {
    for_each = var.users
    name = each.key
}

resource "aws_iam_access_key" "access_keys" {
    for_each = var.users
    user = each.key
}

resource "aws_iam_user_group_membership" "group_memberships" {
    for_each = var.users
    user = each.key
    groups = [for _,group in each.value.groups: aws_iam_group.groups[group].name]
}
