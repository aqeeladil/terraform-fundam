# AWS Provider - Multi-Region

provider "aws" {
  region = "us-east-1"
  alias  = "east"
}

provider "aws" {
  region = "us-west-2"
  alias  = "west"
}

# Azure Provider

provider "azurerm" {
  subscription_id = "your-subscription-id"
  tenant_id       = "your-tenant-id"
  client_id       = "your-client-id"
  client_secret   = "your-client-secret"
}
