terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.79.0"
    }
  }

  backend "http" {
    address = "http://gitlab.bl-lab.net/api/v4/projects/6/terraform/state/proxmox_state"
    lock_address = "http://gitlab.bl-lab.net/api/v4/projects/6/terraform/state/proxmox_state"
    unlock_address = "http://gitlab.bl-lab.net/api/v4/projects/6/terraform/state/proxmox_state"
}

provider "proxmox" {}
