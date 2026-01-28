resource "aws_s3_bucket" "s3_bucket" {

  bucket = "s3-bucket-for-static-webpage"



  tags = {

    Name = "Project 2"

    Environment = "Dev"

  }

}



resource "aws_s3_bucket_public_access_block" "public_access" {

  bucket = aws_s3_bucket.s3_bucket.id



  block_public_acls = false

  block_public_policy = false

  ignore_public_acls = false

  restrict_public_buckets = false

}

resource "aws_s3_object" "index" {

  bucket = aws_s3_bucket.s3_bucket.id

  key = "index.html"

  source = "index.html"

  content_type = "text/html"
}



resource "aws_s3_bucket_website_configuration" "configuring_webpage" {

  bucket = aws_s3_bucket.s3_bucket.id



  index_document {

    suffix = "index.html"

  }

}



resource "aws_s3_bucket_policy" "public_read" {

  bucket = aws_s3_bucket.s3_bucket.id



  policy = jsonencode({

    "Version" : "2012-10-17",

    "Statement" : [

      {

        "Sid" : "PublicReadGetObject",

        "Effect" : "Allow",

        "Principal" : "*",

        "Action" : [

          "s3:GetObject"

        ],

        "Resource" : "${aws_s3_bucket.s3_bucket.arn}/*"

      }

    ]

  })

}


