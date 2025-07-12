resource "proxmox_virtual_environment_vm" "test03" {
  name      = "test03"
  description = "Terraform testing VM"
  node_name = "proxmox01"

  clone {
    vm_id = 104 # debian12-template
  }

  agent {
    enabled = true # Qemu
  }

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
    floating = 2048 # Enables ballooning
  }

  disk {
    datastore_id = "nvme-lvm"
    backup = true
    cache = "writeback"
    discard = "on"
    iothread = true
    interface = "scsi0"
    replicate = true

    size = 40
  }

  initialization {
    dns {
      servers = ["1.1.1.1"]
    }

    ip_config {
      ipv4 {
        address = "10.0.0.13/24"
        gateway = "10.0.0.2"
      }
    }

    user_account {
      username = "ben"
      keys = [var.ssh_key]
    }
  }
}
