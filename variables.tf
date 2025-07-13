variable "proxmox_api_url" {
  type        = string
  description = "Url de conexion con el nodo"
  sensitive   = true
}
variable "proxmox_api_token_id" {
  type        = string
  description = "TokenID de un usuario de proxmox"
  sensitive   = true
}
variable "proxmox_api_token_secret" {
  type        = string
  description = "TokenPass de un usuario de proxmox"
  sensitive   = true
}
variable "root_pass" {
  type        = string
  description = "root password"
  sensitive   = true
}
variable "ansible_ssh_public_key" {
  type        = string
  description = "Ssh public key used by Ansible"
  sensitive   = true
}
variable "node_name" {
  type        = string
  description = "Nombre del Nodo"
  default     = "pve"
}
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
