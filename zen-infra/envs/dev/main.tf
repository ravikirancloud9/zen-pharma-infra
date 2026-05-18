
module "zen_bucket" {
  source = "../../modules/aws_bucket"
  bucket_name = "zen-pharma-dev-bucket"
  
}

module "vpc" {
  source = "../../modules/aws_vpc"

  project                  = "pharma"
  environment              = "dev"
  vpc_cidr                 = "10.0.0.0/16"
  public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  private_eks_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  private_rds_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]
}

module "eks" {
  source = "../../modules/aws_eks"

  project            = "pharma"
  env                = "dev"
  cluster_version    = "1.33"
  subnet_ids         = module.vpc.private_eks_subnet_ids
  node_instance_type = "t3.small"
  desired_capacity   = 2
  min_size           = 1
  max_size           = 4
}
