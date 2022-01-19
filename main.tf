resource "alicloud_ons_instance" "default" {
  instance_name = var.name
  remark        = var.description
}

resource "alicloud_kvstore_instance" "default" {
  vswitch_id       = var.vswitch_id
  zone_id          = var.availability_zone
  db_instance_name = var.name
  security_ips     = var.security_ips
  instance_type    = "Redis"
  engine_version   = var.redis_engine_version
  config = {
    appendonly = var.redis_appendonly, lazyfree-lazy-eviction = var.redis_lazyfree_lazy_eviction,
  }
  resource_group_id = var.redis_resource_group_id
  instance_class    = var.redis_instance_class
}