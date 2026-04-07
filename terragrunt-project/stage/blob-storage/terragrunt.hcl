terraform {
  source = "git@github.com:dimz119/learn-terragrunt.git//modules/s3?ref=v0.0.3"
}

inputs = {
  bucket_name       = "codemke-staging-blob-storage"
  versioning_enabled = true
  tags = {
    Environment = "staging"
    Owner       = "DevOps"
  }
}