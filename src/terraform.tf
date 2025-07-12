terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.79.0"
    }
  }

   backend "http" {
    address = "http://gitlab.bl-lab.net/api/v4/projects/6/terraform/state/tfstate"
    lock_address = "http://gitlab.bl-lab.net/api/v4/projects/6/terraform/state/tfstate"
    unlock_address = "http://gitlab.bl-lab.net/api/v4/projects/6/terraform/state/tfstate"
    lock_method = "POST"
    unlock_method = "DELETE"
    retry_wait_min = 5
   }
}

provider "proxmox" {}
