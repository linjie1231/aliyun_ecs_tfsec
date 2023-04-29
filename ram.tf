resource "alicloud_ram_role" "role" {
  name        = var.verify_role.role_name
  document    = <<EOF
    {
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Effect": "Allow",
          "Principal": {
            "RAM": [
               "acs:ram::1661246986445462:root"
            ]
          }
        }
      ],
      "Version": "1"
    }
EOF
  description = "This is a custom role."
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "attach" {
  policy_name = var.verify_role.policy_name
  policy_type = var.verify_role.policy_type
  role_name   = alicloud_ram_role.role.name
}