resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.vm_name
  node_name = "proxmox01"

  clone {
    vm_id = 104 # debian12-template
  }

  agent {
    enabled = true # Qemu
  }

  cpu {
    cores = var.cores
    type = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory
    floating = var.memory # Enables ballooning
  }

  disk {
    datastore_id = "nvme-lvm"
    backup = true
    cache = "writeback"
    discard = "on"
    iothread = true
    interface = "scsi0"
    replicate = true

    size = var.disk_size
  }

  initialization {
    dns {
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    user_account {
      username = "ben"
      keys = [var.ssh_key]
    }
  }
}
