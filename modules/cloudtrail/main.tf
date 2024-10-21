resource "aws_cloudtrail" "this" {
  name                       = local.trail_name
  s3_bucket_name             = aws_s3_bucket.this.id
  enable_log_file_validation = true
  is_multi_region_trail      = true
  is_organization_trail      = true

  tags_all = merge(local.tags, {
    "Usage" = "management"
  })
  depends_on = [aws_s3_bucket_policy.this]
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.prefix}-cloudtrail-logs"

  tags_all = merge(local.tags, {
    "Usage" = "event-driven"
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}
