resource "aws_s3_bucket" "remote_s3" {
  bucket = "abis-buckett"
  tags = {
    Name = "abis-buckett"

  }
}