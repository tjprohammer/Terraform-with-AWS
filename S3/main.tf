terraform {
  backend "s3" {
    bucket = "${var.TF_BACKEND_BUCKET}"
    key    = "${var.TF_BACKEND_KEY}"
    region = "${var.TF_BACKEND_REGION}"
  }
}