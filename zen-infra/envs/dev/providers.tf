provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "zen-pharma"
      Env       = "dev"
      ManagedBy = "terraform"
    }
  }
}