# policy for lambda to write to cloud watch
resource "aws_iam_role_policy" "iam-policy" {
  name = "cloudwatch-policy"
  role = aws_iam_role.iam_for_notificationQue_lambdas.id

  policy = file("${path.module}/iam-policy.json")
}


# lambda basic permisson for execution from the api gateway
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role = aws_iam_role.iam_for_notificationQue_lambdas.name
}

