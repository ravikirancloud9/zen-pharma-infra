
module "zen_bucket" {
  source = "../../modules/aws_bucket"
  bucket_name = "zen-pharma-dev-bucket"
  
}

module "vpc" {
  source = "../../modules/vpc"

  project                  = "pharma"
  environment              = "dev"
  vpc_cidr                 = "10.0.0.0/16"
  public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  private_eks_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  private_rds_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]
}