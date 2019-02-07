data "aws_iam_policy_document" "sts_assume_trust_policy" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals = {
      type = "AWS"
    }
  }
}
