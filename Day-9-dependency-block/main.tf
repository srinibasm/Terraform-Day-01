#IAM policy for s3 access 
resource "aws_iam_policy" "s3_policy" {
  name = "s3-access-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject"
      ],
      Resource = [
        "arn:aws:s3:::my-bucket-name",
        "arn:aws:s3:::my-bucket-name/*"
      ]
    }]
  })
}

#ceation an IAM role for EC2 to assume
resource "aws_iam_role" "ec2_role" {
  name = "ec2-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}
#Attach Policy to Role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
  depends_on = [aws_iam_policy.s3_policy]
}
#Create Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "name" {
    instance_type = "t2.micro"
    ami = "ami-0b0b78dcacbab728f"
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}

resource "aws_s3_bucket" "name" {
  bucket = "my-unique-bucket-name-2244silon"
  depends_on = [ aws_instance.name ]
 #dependency block is used to explicitly specify the order of resource creation.
 #so here after creating EC2 instance, it will create the s3 bucket.
 }
