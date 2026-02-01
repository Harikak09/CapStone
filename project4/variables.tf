variable "s3_policy" {

  type        = string

  default = <<EOF

{

  "Version": "2012-10-17",

  "Statement": [

    {

      "Effect": "Allow",

      "Action": [

        "s3:ListBucket",

        "s3:GetObject",

        "s3:PutObject"

      ],

      "Resource": [

        "arn:aws:s3:::project3-test-user-bucket",

        "arn:aws:s3:::project3-test-user-bucket/*"

      ]

    }

  ]

}

EOF

}


