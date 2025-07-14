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
variable "node_name" {
  type        = string
  description = "Nombre del Nodo"
  sensitive   = true
}
variable "ct_root_pass" {
  type        = string
  description = "root password"
  sensitive   = true
}
variable "ct_ansible_ssh_public_key" {
  type        = string
  description = "Ssh public key used by Ansible"
  sensitive   = true
}
