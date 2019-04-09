data "aws_iam_policy_document" "sts_assume_trust_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals = {
      type = "AWS"
      identifiers = ["${var.account_number_root}"]
   }
  }
 }
resource "aws_iam_role" "sts_role_trust_policy" {
  name               = "sts_assume_trust_policy"
  description        = "sts assume role nist"
  assume_role_policy = "${data.aws_iam_policy_document.sts_assume_trust_policy.json}"
}

