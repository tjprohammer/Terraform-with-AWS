Configuring S3 backend for storing Terraform Sate

export TF_BACKEND_BUCKET=terraform-bucket-tjprohammer
export TF_BACKEND_KEY=tjprohammer-terraform-state.tfstate
export TF_BACKEND_REGION=us-west-2


  -backend-config="bucket=${TF_BACKEND_BUCKET}" \  
  -backend-config="key=${TF_BACKEND_KEY}" \  
  -backend-config="region=${TF_BACKEND_REGION}"  
  
    
To pull terraform state use 'terraform state pull'  
  
To upload the backend use 'terraform state push'  
terraform state push s3://my-bucket/terraform.tfstate  
  