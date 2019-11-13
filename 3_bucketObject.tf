resource "aws_s3_bucket_object" "flights" {
  bucket = "${aws_s3_bucket.bucketsource.id}"
  key = "${var.flightsTableName}/flights.csv"
  source = "flights.csv"
}

resource "aws_s3_bucket_object" "airlines" {
  bucket = "${aws_s3_bucket.bucketsource.id}"
  key = "${var.airlinesTableName}/airlines.csv"
  source = "airlines.csv"
}
