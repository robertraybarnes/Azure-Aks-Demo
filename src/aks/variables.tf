//All variables denoted with "ENC" should be passed in via tfvars
variable "ENC__sp_client_id" {
  type        = "string"
  description = "Service Principle client ID"
}

variable "ENC__ssh_key" {
  type        = "string"
  description = "ssh public key used for linux profile on cluster"
}

variable "ENC__sp_client_secret" {
  type        = "string"
  description = "Service principle password"
}

variable "dns_prefix" {
  type        = "string"
  description = "Kubernetes Cluster dns prefix"
  default     = "aksdemocluster"
}

variable "default_region" {
  type        = "string"
  description = "default azure region"
  default     = "westeurope"
}

variable "vm_size" {
  type        = "string"
  description = "vm size to build the kubernetes cluster on"
  default     = "Standard_D2_v2"
}

variable "aksdemo_rg" {
  type        = "string"
  description = "name of resource group"
  default     = "aksdemo_rg"
}

variable "environment" {
  type        = "string"
  description = "environment being provisioned"
  default     = "demo"
}

variable "aksdemo_sa" {
  type        = "string"
  description = "name of storage account"
}

variable "aksdemo_cr" {
  type        = "string"
  description = "Name of container registry"
}

variable "aksdemocluster" {
  type        = "string"
  description = "name of Kubernetes cluster"
  default     = "aksdemocluster"
}

variable "admin_username" {
  type        = "string"
  description = "admin username for the kubernetes cluster"
  default     = "aksdemouser"
}
