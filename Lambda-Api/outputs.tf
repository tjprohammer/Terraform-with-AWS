# Output value definitions

output "lambda_bucket_testing" {
  description = "Name of the S3 bucket used to store function code."

  value = aws_s3_bucket.lambda_bucket.id
}

output "hello_test_function_name" {
  description = "Name of lambda function"

  value = aws_lambda_function.hello_test_function
}
