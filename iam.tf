resource "aws_iam_user" "k8s" {
  name = "k8suser"
  path = "/"
}

resource "aws_iam_policy" "eks-full-access-policy" {
  name        = "eks-full-access-policy"
  description = "EKS Full Access Policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "eks:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "eks-policy-attach" {
  name       = "eks-policy-attachment"
  users      = [aws_iam_user.k8s.name]
  policy_arn = aws_iam_policy.eks-full-access-policy.arn
}

