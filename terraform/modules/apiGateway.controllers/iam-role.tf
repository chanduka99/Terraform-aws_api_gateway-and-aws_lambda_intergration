data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


# configure role for lambda
resource "aws_iam_role" "iam_for_notificationQue_lambdas" {
  name               = "iam_for_notificationQue_lambdas"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}