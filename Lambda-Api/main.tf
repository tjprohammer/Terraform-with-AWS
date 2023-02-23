provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      hashicorp-learn = "lambda-api-gateway"
    }
  }

}

resource "random_pet" "lambda_bucket_name" {
  prefix = "learn-terraform-functions"
  length = 4
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = random_pet.lambda_bucket_name.id
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.lambda_bucket.id
  acl    = "private"
}

//the archive_file data source generates a zip archive and an aws_s3_object resource to upload the archive to your S3 bucket\
data "archive_file" "lambda_s3-upload-lamdba" {
  type = "zip"

  source_dir  = "${path.module}/lambda_s3-upload"
  output_path = "${path.module}/lambda_s3-upload.zip"
}

resource "aws_s3_object" "lambda_s3-upload-lamdba" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "hello-world.zip"
  source = data.archive_file.lambda_s3-upload-lamdba.output_path

  etag = filemd5(data.archive_file.lambda_s3-upload-lamdba.output_path)
}
