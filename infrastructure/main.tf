terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.19.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}