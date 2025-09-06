data "aws_iam_user" "terraform" {
  user_name = "terraform"
}

resource "aws_iam_role" "full_access" {
  name = "FullAccess"

  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_user.terraform.arn]
    }
  }
}

data "aws_iam_policy_document" "full_access_policy" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "full_access_policy" {
  name        = "full-access-policy"
  description = "Full Access policy"
  policy      = data.aws_iam_policy_document.full_access_policy.json
}

resource "aws_iam_role_policy_attachment" "full_access_policy_attach" {
  role       = aws_iam_role.full_access.name
  policy_arn = aws_iam_policy.full_access_policy.arn
}
