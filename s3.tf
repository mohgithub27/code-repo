resource "aws_s3_bucket" "example" {
  bucket = "bucket-created-through-iac"
}

resource "aws_s3_bucket_object" "example" {
  bucket = aws_s3_bucket.example.id
  key    = "example-job-script.py"
  source = "example-job-script.py"

}
