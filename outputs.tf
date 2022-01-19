output "this_ons_id" {
  value = alicloud_ons_instance.default.id
}

output "this_ons_name" {
  value = alicloud_ons_instance.default.instance_name
}

output "this_redis_name" {
  value = alicloud_kvstore_instance.default.db_instance_name
}