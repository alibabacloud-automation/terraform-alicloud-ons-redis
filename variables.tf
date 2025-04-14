#alicloud_ons_instance
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = ""
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = ""
}

#alicloud_kvstore_instance
variable "vswitch_id" {
  description = "VSwitch variables, if vswitch_id is empty, then the net_type = classic."
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The available zone to launch modules."
  type        = string
  default     = ""
}

variable "security_ips" {
  description = "The specification of the security ips."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "redis_engine_version" {
  description = "The specification of the redis engine version."
  type        = string
  default     = "4.0"
}

variable "redis_appendonly" {
  description = "The specification of the redis appendonly."
  type        = string
  default     = "yes"
}

variable "redis_lazyfree_lazy_eviction" {
  description = "The specification of the redis lazyfree-lazy-eviction."
  type        = string
  default     = "yes"
}

variable "redis_resource_group_id" {
  description = "The specification of the redis resource group id."
  type        = string
  default     = ""
}

variable "redis_instance_class" {
  description = "The specification of the redis resource instance class."
  type        = string
  default     = "redis.master.large.default"
}

