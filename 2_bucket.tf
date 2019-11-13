resource "aws_s3_bucket" "bucketsource" {
  bucket = "${var.bucketName}-source"
    force_destroy = true
}

resource "aws_s3_bucket" "bucktresult" {
    bucket = "${var.bucketName}-result"  
    force_destroy = true
}
