resource "alicloud_alb_load_balancer" "main" {
  vpc_id                 = data.alicloud_vpcs.main_vpc.vpcs.0.id
  address_type           = var.verify_alb.address_type
  address_allocated_mode = var.verify_alb.address_allocated_mode
  load_balancer_name     = var.verify_alb.load_balancer_name
  load_balancer_edition  = var.verify_alb.load_balancer_edition
  load_balancer_billing_config {
    pay_type = var.verify_alb.pay_type
  }
  zone_mappings {
    vswitch_id = var.verify_alb.vswitch_id_01
    zone_id    = var.verify_alb.zone_id_01
  }
  zone_mappings {
    vswitch_id = var.verify_alb.vswitch_id_02
    zone_id    = var.verify_alb.zone_id_02
  }
}


resource "alicloud_alb_server_group" "default" {
  count = length(var.alb_server_group_port)
  server_group_name = "alb_server_group_${var.alb_server_group_port[count.index]}"
  protocol          = var.verify_alb_server_group.protocol
  vpc_id            = data.alicloud_vpcs.main_vpc.vpcs.0.id
  health_check_config {
    health_check_enabled = var.verify_alb_server_group.health_check_enabled
  }
  sticky_session_config {
    sticky_session_enabled = var.verify_alb_server_group.sticky_session_enabled
  }
  servers {
    description = "CNAL1LXWFT401"
    port        = var.alb_server_group_port[count.index]
    server_id   = alicloud_instance.CNAL1LXWFT401.id
	server_ip   = alicloud_instance.CNAL1LXWFT401.private_ip
    server_type = "Ecs"
    weight      = 100
  }
}