resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.vm_name
  node_name = "proxmox01"

  clone {
    vm_id = 104 # debian12-template
  }

  agent {
    enabled = true # Qemu
    trim    = true # FSTRIM on VM migration
  }

  cpu {
    cores = var.cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory
    floating  = var.memory # Enables ballooning
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      interface    = "scsi${disk.key}" # Auto-increment scsi0, scsi1 etc
      size         = disk.value.size
      datastore_id = lookup(disk.value, "datastore_id", "nvme-lvm")
      backup       = disk.value.backup
      cache        = disk.value.cache
      discard      = disk.value.discard
      iothread     = disk.value.iothread
      replicate    = disk.value.replicate
    }
  }

  network_device {
    vlan_id = var.vlan_tag
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
      keys     = [var.ssh_key]
    }
  }
}
