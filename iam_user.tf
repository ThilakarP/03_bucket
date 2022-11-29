# Definition of IAM users and groups

resource "aws_iam_user" "user00001" {
  name = "user00001"
}

resource "aws_iam_user" "user00002" {
  name = "user00002"
}

resource "aws_iam_group" "ec2-container-registry-poweruser-group" {
    name = "ec2-container-registry-poweruser-group"  
}

# Assign users to group
resource "aws_iam_group_membership" "assignment" {
  name = "assignment"
  users = [
    aws_iam_user.user00001.name,
    aws_iam_user.user00002.name
  ]
  group = aws_iam_group.ec2-container-registry-poweruser-group.name   

  }
# attach policy to the group
 resource "aws_iam_policy_attachment" "attachment" {
   name = "attachment"
   groups = [aws_iam_group.ec2-container-registry-poweruser-group.name]
   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
 }