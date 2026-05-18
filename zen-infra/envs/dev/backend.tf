terraform {
  required_version = "1.15.3"

  cloud {

    organization = "devops_cloud_k8"

    workspaces {
      name = "zen-pharma-infra-dev"
    }
  }
}