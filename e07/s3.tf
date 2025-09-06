resource "aws_s3_bucket" "terraform_states" {
  bucket = "innedimx-terraform-states"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_states.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.terraform_states.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.terraform_states.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.terraform_states.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
            "AWS" = [
                data.aws_iam_user.terraform.arn
            ]
        }
        Action = [
            "s3:GetObject",
            "s3:PutObject",
            "s3:DeleteObject"
        ]
        Resource = [
            "${aws_s3_bucket.terraform_states.arn}/states/*"
        ]
      },
      {
        Effect = "Allow"
        Principal = {
            "AWS" = [
                data.aws_iam_user.terraform.arn
            ]
        }
        Action = [
            "s3:ListBucket",
        ]
        Resource = [
            aws_s3_bucket.terraform_states.arn
        ]
      }
    ]
  })
}
