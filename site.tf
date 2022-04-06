
resource "aws_s3_bucket" "blog_bucket" {
    bucket = var.blog_host_name
}

resource "aws_s3_bucket_acl" "blog_bucket_acl" {
    bucket = aws_s3_bucket.blog_bucket.id
    acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
    bucket = aws_s3_bucket.blog_bucket.bucket
    index_document {
        suffix = "index.html"
    }
    error_document {
        key = "error.html"
    }
}

#data "aws_iam_policy_document" "blog_policy" {
#    statement {
#        actions = [
#            "s3:GetObject"
#        ]
#        principals {
#            identifiers = ["*"]
#            type = "AWS"
#        }
#        resources = [
#            "arn:aws:s3:::${var.blog_host_name}/*"
#        ]
#    }
#}
