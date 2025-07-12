variable "vm_name" {
  type = string
}

variable "cores" {
  type = number
  default = 2
}

variable "memory" {
  type = number
  default = 2048

}

variable "disk_size" {
  type = number
  default = 20
}

variable "dns_servers" {
  type = list(string)
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
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIVH1sqsDKtYp/UfJuw9jgNcilkbKE0skhEz4/LwtVWj ben@bl-lab.net"
  description = "SSH public key"
}
