variable "vm_name" {
  type = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048

}

variable "disks" {
  description = "List of disks"
  type = list(object({
    size         = number
    datastore_id = optional(string)
    backup       = optional(bool, true)
    cache        = optional(string, "writeback")
    discard      = optional(string, "on")
    iothread     = optional(bool, true)
    replicate    = optional(bool, true)
  }))
  default = []
}

variable "vlan_tag" {
  type = number
}

variable "dns_servers" {
  type    = list(string)
  default = ["1.1.1.1"]
}

variable "ip_address" {
  type = string
}

variable "gateway" {
  type = string
}

## SSH Key

variable "ssh_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIVH1sqsDKtYp/UfJuw9jgNcilkbKE0skhEz4/LwtVWj ben@bl-lab.net"
  description = "SSH public key"
}
