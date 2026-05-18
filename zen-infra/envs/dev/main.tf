
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

# module "rds" {
#   source = "../../modules/aws_rds"

#   project               = "pharma"
#   env                   = "dev"
#   subnet_ids            = module.vpc.private_rds_subnet_ids
#   vpc_id                = module.vpc.vpc_id
#   eks_security_group_id = module.eks.cluster_security_group_id
#   db_name               = "pharmadb"
#   db_username           = "pharmaadmin"
#   db_password           = var.db_password
# }

module "ecr" {
  source = "../../modules/aws_ecr"

  project = "pharma"
  env     = "dev"
  repositories = [
    "api-gateway",
    "auth-service",
    "drug-catalog-service",
    "inventory-service",
    "manufacturing-service",
    "notification-service",
    "pharma-ui",
    "supplier-service",
    "qc-service"
  ]
}

# module "iam" {
#   source = "../../modules/aws_iam"

#   project           = "pharma"
#   env               = "dev"
#   oidc_provider_arn = module.eks.oidc_provider_arn
#   oidc_provider_url = module.eks.oidc_provider_url
#   aws_account_id    = data.aws_caller_identity.current.account_id
#   github_org        = var.github_org
# }

module "secrets_manager" {
  source = "../../modules/aws_secrets_manager"

  project     = "pharma"
  env         = "dev"
  db_username = "pharmaadmin"
  db_password = var.DEV_DB_PASSWORD
  jwt_secret  = var.DEV_JWT_SECRET
}