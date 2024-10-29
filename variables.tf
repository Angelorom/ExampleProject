variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to be imported."
  nullable    = true
}

variable "use_for_each" {
  type        = bool
  description = "Use `for_each` instead of `count` to create multiple resource instances."
  nullable    = true
}

variable "vnet_location" {
  type        = string
  description = "The location of the vnet to create."
  nullable    = true
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "The address space that is used by the virtual network."
}

variable "bgp_community" {
  type        = string
  default     = null
  description = "(Optional) The BGP community attribute in format `<as-number>:<community-value>`."
}

variable "ddos_protection_plan" {
  type = object({
    enable = bool
    id     = string
  })
  default     = null
  description = "The set of DDoS protection plan configuration"
}

# If no values specified, this defaults to Azure DNS
variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "The DNS servers to be used with vNet."
}

variable "nsg_ids" {
  type = map(string)
  default = {
  }
  description = "A map of subnet name to Network Security Group IDs"
}

variable "route_tables_ids" {
  type        = map(string)
  default     = {}
  description = "A map of subnet name to Route table ids"
}

variable "subnet_delegation" {
  type        = map(map(any))
  default     = {}
  description = "A map of subnet name to delegation block on the subnet"
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  type        = map(bool)
  default     = {}
  description = "A map of subnet name to enable/disable private link endpoint network policies on the subnet."
}

variable "subnet_enforce_private_link_service_network_policies" {
  type        = map(bool)
  default     = {}
  description = "A map of subnet name to enable/disable private link service network policies on the subnet."
}

variable "subnet_names" {
  type        = list(string)
  default     = ["subnet1", "subnet2", "subnet3"]
  description = "A list of public subnets inside the vNet."
}

variable "subnet_prefixes" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "The address prefix to use for the subnet."
}

variable "subnet_service_endpoints" {
  type        = map(any)
  default     = {}
  description = "A map of subnet name to service endpoints to add to the subnet."
}

variable "tags" {
  type = map(string)
  default = {
    ENV = "test"
  }
  description = "The tags to associate with your network and subnets."
}

# tflint-ignore: terraform_unused_declarations
variable "tracing_tags_enabled" {
  type        = bool
  default     = true
  description = "Whether enable tracing tags that generated by BridgeCrew Yor."
  nullable    = true
}

# tflint-ignore: terraform_unused_declarations
variable "tracing_tags_prefix" {
  type        = string
  default     = "avm_"
  description = "Default prefix for generated tracing tags"
  nullable    = true
}

variable "vnet_name" {
  type        = string
  default     = "acctvnet"
  description = "Name of the vnet to create"
}
