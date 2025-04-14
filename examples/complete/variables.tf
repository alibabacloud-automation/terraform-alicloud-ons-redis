#alicloud_ons_instance
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "tf-ons-redis"
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = "tf-ons-redis-description"
}

#alicloud_kvstore_instance
variable "security_ips" {
  description = "The specification of the security ips."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "redis_engine_version" {
  description = "The specification of the redis engine version."
  type        = string
  default     = "5.0"
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