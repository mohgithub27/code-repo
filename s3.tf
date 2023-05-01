resource "aws_s3_bucket" "example" {
  bucket = "bucket-created-through-iac"
}
resource "aws_s3_bucket" "exampleeee" {
  bucket = " destination-bucket-created-through-iac"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "archive"
    enabled = true
    prefix  = "archive/"
    transition {
      days          = 730
      storage_class = "GLACIER"
    }
    expiration {
      days = 1825
    }
  }

}
