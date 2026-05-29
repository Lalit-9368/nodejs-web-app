# S3 Bucket storing logs

resource "aws_s3_bucket" "nodejs-web-app-logs" {
  bucket = "la-nodejs-web-app-logs"
}

resource "aws_s3_bucket_ownership_controls" "nodejs-web-app-logs" {
  bucket = aws_s3_bucket.nodejs-web-app-logs.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "nodejs-web-app-logs-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.nodejs-web-app-logs]
  bucket     = aws_s3_bucket.nodejs-web-app-logs.id
  acl        = "private"
}

#########################################################

# S3 Bucket storing jenkins user data

resource "aws_s3_bucket" "jenkins-config" {
  bucket = "la-jenkins-config"
}

resource "aws_s3_bucket_ownership_controls" "jenkins-config" {
  bucket = aws_s3_bucket.jenkins-config.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "jenkins-config-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.jenkins-config]
  bucket     = aws_s3_bucket.jenkins-config.id
  acl        = "private"
}

#########################################################

resource "aws_s3_object" "jenkins-config_2" {
  bucket = aws_s3_bucket.jenkins-config.id

  for_each = fileset("jenkins-config/", "*")

  key    = each.value
  source = "jenkins-config/${each.value}"

  etag = filemd5("jenkins-config/${each.value}")
}
