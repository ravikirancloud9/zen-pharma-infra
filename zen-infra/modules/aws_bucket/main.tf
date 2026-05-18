resource "aws_s3_bucket" "bucket_name" {
  bucket = var.bucket_name

}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket_name.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }

}