resource "alicloud_slb_load_balancer" "main" {
  load_balancer_name = var.verify_clb.load_balancer_name
  address_type       = var.verify_clb.address_type
  load_balancer_spec = var.verify_clb.load_balancer_spec
  vswitch_id         = data.alicloud_vswitches.main_switch.vswitches.0.id
  master_zone_id     = var.verify_clb.master_zone_id
  slave_zone_id      = var.verify_clb.slave_zone_id
  payment_type       = var.verify_clb.payment_type
  period             = var.verify_clb.period
  tags = {
    info = var.verify_clb.load_balancer_name
  }
}


resource "alicloud_slb_server_group" "main" {
  load_balancer_id = alicloud_slb_load_balancer.main.id
  name = var.verify_clb_server_group.name
    servers {
    server_ids = [alicloud_instance.CNAL1LXWFT401.id]
    port       = var.verify_clb_server_group.port
    weight     = var.verify_clb_server_group.weight
  }
}


resource "alicloud_slb_listener" "main" {
  load_balancer_id = alicloud_slb_load_balancer.main.id
  backend_port     = var.verify_clb_server_group.port
  frontend_port    = var.verify_clb_server_group.port
  protocol         = var.verify_clb_server_group.protocol
  bandwidth        = var.verify_clb_server_group.weight
  scheduler        = var.verify_clb_server_group.scheduler
  server_group_id  = alicloud_slb_server_group.main.id
}