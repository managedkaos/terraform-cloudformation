resource "aws_key_pair" "key" {
  key_name_prefix = "${var.name}-"
  public_key      = var.public_key
  tags            = var.tags
}
locals {
  template = {
    "wordpress" = file("${path.module}/WordPress_Bootstrap_AmazonLinux2.template")
    "rails"     = file("${path.module}/Rails_Single_Instance.template")
  }
}

resource "aws_cloudformation_stack" "stack" {
  name          = var.name
  tags          = var.tags
  template_body = lookup(local.template, var.template, file("${path.module}/WordPress_Bootstrap_AmazonLinux2.template"))

  parameters = {
    DBName         = "wordpressdb"
    DBPassword     = "wordpressdb"
    DBRootPassword = "wordpressdb"
    DBUser         = "wordpressdb"
    InstanceType   = var.instance_type
    KeyName        = aws_key_pair.key.id
    SSHLocation    = "0.0.0.0/0"
  }

  lifecycle {
    ignore_changes = [
      parameters,
    ]
  }
}
