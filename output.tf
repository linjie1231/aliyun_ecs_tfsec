output "switch" {
    value = "${data.alicloud_vswitches.main_switch}"
}

output "vpcs" {
  value = "${data.alicloud_vpcs.main_vpc}"
}