# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}


# resource "aws_instance" "InstanceForIAM" {
#   ami           = "ami-094125af156557ca2"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Myserver via github actions"
#   }
# }


# resource "aws_s3_bucket" "secondbucket" {
#   bucket = "thilak-bucket-7587587845"
  
  
#     tags = {
#     Name        = "IAM Policy Bucket"
#     Environment = "Dev"
#   }
# }


# output "private_ip" {
#   value = aws_instance.InstanceForIAM.private_ip
# }



/*
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
*/

# data "aws_iam_policy_document" "example" {
#   statement {
#     sid = "1"

#     actions = [
#       "s3:ListAllMyBuckets",
#       "s3:GetBucketLocation",
#     ]

#     resources = [
#       "arn:aws:s3:::*",
#     ]
#   }

#   statement {
#     effect="Allow"
#     actions = [
#       "s3:ListBucket",
#     ]
#     resources = [
#       aws_s3_bucket.secondbucket.arn
#     ]
#   }

#     statement {
#     effect="Allow"
#     actions = [
#       "s3:GetObject",
#       "s3:PutObject"
#     ]
#     resources = [
#       aws_s3_bucket.secondbucket.arn
#     ]
#   }


# }

# resource "aws_iam_policy" "policydoc" {
#   name   = "tf-policydoc"
#   path   = "/"
#   policy = data.aws_iam_policy_document.example.json
# }