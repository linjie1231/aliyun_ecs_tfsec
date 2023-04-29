data "alicloud_vswitches" "main_ip_vs" {
    zone_id = var.verify_alb.zone_id_01

}

resource "alicloud_security_group" "group" {
  name        = var.verify_security_group.name
  description = var.verify_security_group.description
  vpc_id = data.alicloud_vpcs.main_vpc.vpcs.0.id
}

resource "alicloud_security_group_rule" "allow_443" {
  depends_on   = [alicloud_alb_load_balancer.main]
  type              = "ingress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "443/443"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = data.alicloud_vswitches.main_ip_vs.vswitches.0.cidr_block
}
resource "alicloud_security_group_rule" "allow_8443" {
  depends_on   = [alicloud_alb_load_balancer.main]
  type              = "ingress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "8443/8443"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = data.alicloud_vswitches.main_ip_vs.vswitches.0.cidr_block
}
resource "alicloud_security_group_rule" "allow_7443" {
  depends_on   = [alicloud_alb_load_balancer.main]
  type              = "ingress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "7443/7443"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = data.alicloud_vswitches.main_ip_vs.vswitches.0.cidr_block
}
resource "alicloud_security_group_rule" "allow_5222" {
  depends_on   = [alicloud_slb_load_balancer.main]
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "5222/5222"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = alicloud_slb_load_balancer.main.address
}
resource "alicloud_security_group_rule" "allow_5222" {
  type              = "ingress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "drop"
  port_range        = "1/65535"
  priority          = 2
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}

#安全组出方向默认允许所有访问
#resource "alicloud_security_group_rule" "egress_all" {
#  type              = "egress"
#  ip_protocol       = "all"
#  nic_type          = "intranet"
#  policy            = "accept"
#  port_range        = "1/65535"
#  priority          = 1
#  security_group_id = alicloud_security_group.group.id
#  cidr_ip           = "0.0.0.0/0"
#}