provider "aws" {
  region = "us-east-2"

}

resource "aws_iam_role" "WagesCalculator" {
  name = "WagesCalculator"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "WagesCalculator_lambda" {
  filename          = "../target/WagesCalculator.zip"
  function_name     = "WagesCalculator-golambda"
  role          = aws_iam_role.WagesCalculator.arn
  handler       = "WagesCalculatorbin"

  source_code_hash = filebase64sha256("../target/WagesCalculator.zip")

  runtime = "go1.x"
  memory_size       = 128
  timeout           = 10
  environment {
    variables = {
      foo = "bar"
    }
  }
}
