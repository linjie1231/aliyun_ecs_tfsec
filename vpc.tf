
data "alicloud_vswitches" "main_switch" {
  cidr_block = var.verify_switch_ip.cidr_block
}

data "alicloud_vpcs" "main_vpc" {
  cidr_block = var.verify_vpc_ip.cidr_block
}


data "alicloud_nat_gateways" "main_nat" {
  name_regex = var.verify_select_nat.name
}


resource "alicloud_route_table" "private_router" {
 vpc_id           = data.alicloud_vpcs.main_vpc.vpcs.0.id
  route_table_name = var.verify_router_private.name
}

resource "alicloud_route_table" "public_router" {
  vpc_id           = data.alicloud_vpcs.main_vpc.vpcs.0.id
  route_table_name = var.verify_router_public.name
}


resource "alicloud_route_table_attachment" "main_private" {
  vswitch_id     = data.alicloud_vswitches.main_switch.vswitches.0.id
  route_table_id = alicloud_route_table.private_router.id
}

resource "alicloud_route_table_attachment" "main_public" {
  vswitch_id     = data.alicloud_vswitches.main_switch.vswitches.0.id
  route_table_id = alicloud_route_table.public_router.id
}


resource "alicloud_route_entry" "main" {
  route_table_id        = alicloud_route_table.public_router.id
  destination_cidrblock = var.verify_router.destination_cidrblock
  nexthop_type          = var.verify_router.nexthop_type
  nexthop_id            = var.verify_router.nexthop_id
}