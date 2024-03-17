#account variable
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

#vm variable
variable "vm_size"{
    type = string
    description = "vm size"
    default = "Standard_D1_v2"
}

#global
variable "location"{
    type = string
    description = "location for all resources"
    default = "eastus"
}



