//- A role, with no permissions, which can be assumed by users within the same account,
//- A policy, allowing users / entities to assume the above role,
//- A group, with the above policy attached,
//- A user, belonging to the above group.

//I used the codes from https://registry.terraform.io/providers/hashicorp/aws/latest/docs

//create assume role prod-ci-role
resource "aws_iam_role" "prod-ci-role" {
  name = "prod-ci-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "denied"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

//create policy - prod-ci-policy
resource "aws_iam_policy" "prod-ci-policy" {
  name        = "prod-ci-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

//Attach role with policy
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.prod-ci-role
  policy_arn = aws_iam_policy.prod-ci-policy
}

//create group prod-ci-policy
resource "aws_iam_group" "prod-ci-policy" {
  name = "prod-ci-group"
  path = "/users/"
}

//Attach group prod-ci-group with prod-ci-policy
resource "aws_iam_group_policy_attachment" "attach" {
  group      = aws_iam_group.prod-ci-group
  policy_arn = aws_iam_policy.prod-ci-policy
}

//create user - prod-ci-user
resource "aws_iam_user" "prod-ci-user" {
  name = "prod-ci-user"
  path = "/system/"
}

//Add the user prod-ci-user to group prod-ci-group
resource "aws_iam_user_group_membership" "prod-ci2" {
  user = aws_iam_user.prod-ci-user.name

  groups = [
    aws_iam_group.prod-ci-group.name,
  ]
}