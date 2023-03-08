# resource "aws_iam_user" "user" {
#   name = "user"
# }

# resource "aws_iam_policy" "terraform_policy" {
#   name   = "terraform-access-control-policy"
#   path   = "/"
#   policy = jsonencode({
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "s3:*"
#       ],
#       "Resource": [
#         "arn:aws:s3:::bucket",
#         "arn:aws:s3:::bucket/*"
#       ]
#     }
#   ]
#   })
# }

# resource "aws_iam_user_policy_attachment" "policy_attachment" {
#   user       = aws_iam_user.user.name
#   policy_arn = aws_iam_policy.terraform_policy.arn
# }