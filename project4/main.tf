resource "aws_s3_bucket" "project3_bucket" {

  bucket = "project3-test-user-bucket" 

}


resource "aws_iam_user" "s3_user" {

  name = "project3-iam-s3-user"

  path = "/project3/"

}



resource "aws_iam_policy" "s3_policy" {

  name        = "project3-s3-policy"

  policy      = var.s3_policy

}



resource "aws_iam_user_policy_attachment" "attach_policy" {

  user       = aws_iam_user.s3_user.name

  policy_arn = aws_iam_policy.s3_policy.arn

}


