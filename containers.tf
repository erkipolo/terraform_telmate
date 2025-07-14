variable "stage_ct_initial_id" {
  type        = number
  description = "Valor inicial de VMID"
  default     = 200
}
variable "stage_ct_count" {
  type        = number
  description = "Cantidad de CT a desplegar"
  default     = 2
}
variable "search_domain" {
  type        = string
  description = "Dominio de Busqueda DNS"
  default     = "homelab.cu"
}
variable "dns_servers" {
  type        = string
  description = "Servidores DNS"
  default     = "192.168.56.1"
}
variable "private_subnet" {
  type        = string
  description = "Sub Red privada"
  default     = "192.168.56."
}
variable "initial_ip" {
  type        = number
  description = "IP inicial de la subred privada (valor=>2)"
  default     = 200
}
variable "private_subnet_mask" {
  type        = string
  description = "Mascara de la red privada"
  default     = "/24"
}
variable "ostemplate" {
  type        = string
  description = "nombre de la plantilla de proxmox"
  default     = "debian-12-standard_12.7-1_amd64.tar.zst"
}
resource "proxmox_lxc" "stage-ct" {
  count           = var.stage_ct_count
  cores           = 2
  memory          = 512
  swap            = 512
  onboot          = true
  hostname        = "stage-ct-${var.stage_ct_initial_id + count.index + 1}"
  nameserver      = var.dns_servers
  ostemplate      = "local:vztmpl/${var.ostemplate}"
  password        = var.ct_root_pass
  searchdomain    = var.search_domain
  ssh_public_keys = var.ct_ansible_ssh_public_key
  start           = true
  target_node     = var.node_name
  unprivileged    = true
  vmid            = var.stage_ct_initial_id + count.index + 1
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    gw       = "${var.private_subnet}1"
    ip       = "${var.private_subnet}${var.initial_ip + count.index + 1}${var.private_subnet_mask}"
    name     = "eth0"
  }
  rootfs {
    size    = "2G"
    storage = "local-lvm"
  }
}
