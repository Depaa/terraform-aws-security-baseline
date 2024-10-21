output "cloudtrail_s3_bucket_name" {
  value       = aws_s3_bucket.this.id
  description = "The name of the S3 bucket where CloudTrail logs are stored"
}

output "cloudtrail_s3_bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the S3 bucket where CloudTrail logs are stored"
}

output "cloudtrail_name" {
  value       = aws_cloudtrail.this.name
  description = "The name of the CloudTrail"
}

output "cloudtrail_arn" {
  value       = aws_cloudtrail.this.arn
  description = "The ARN of the CloudTrail"
}

### Parameter Store

resource "aws_ssm_parameter" "cloudtrail_s3_bucket_name" {
  name  = "/management/cloudtrail/s3_bucket/name"
  type  = "String"
  value = aws_s3_bucket.this.id

  tags_all = merge(local.tags, {
    "Usage" = "management"
  })
}

resource "aws_ssm_parameter" "cloudtrail_s3_bucket_arn" {
  name  = "/management/cloudtrail/s3_bucket/arn"
  type  = "String"
  value = aws_s3_bucket.this.arn

  tags_all = merge(local.tags, {
    "Usage" = "management"
  })
}

resource "aws_ssm_parameter" "cloudtrail_name" {
  name  = "/management/cloudtrail/name"
  type  = "String"
  value = aws_cloudtrail.this.name

  tags_all = merge(local.tags, {
    "Usage" = "management"
  })
}

resource "aws_ssm_parameter" "cloudtrail_arn" {
  name  = "/management/cloudtrail/arn"
  type  = "String"
  value = aws_cloudtrail.this.arn

  tags_all = merge(local.tags, {
    "Usage" = "management"
  })
}