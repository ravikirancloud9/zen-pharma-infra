
module "zen_bucket" {
  source = "../../modules/s3_bucket"
  bucket_name = "zen-pharma-dev-bucket"
  
}