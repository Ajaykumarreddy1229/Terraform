
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

variable "bucket_name" {
  description = "Existing S3 bucket name"
  type        = string
}
