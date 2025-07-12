terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.79.0"
    }
  }
}

proxmox = {
  source = "bpg/proxmox"
}
