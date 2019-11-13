resource "aws_athena_database" "AthenaDatabase" {
  name = "${var.databaseName}"
  bucket = "${aws_s3_bucket.bucketsource.bucket}"
  force_destroy = true
}

resource "aws_iam_user" "AthenaUser" {
  name = "${var.databaseName}-user"
  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "AthenaUserAthenaAttachment" {
  user = "${aws_iam_user.AthenaUser.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
}

resource "aws_iam_user_policy_attachment" "AthenaUserS3Attachment" {
  user = "${aws_iam_user.AthenaUser.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

