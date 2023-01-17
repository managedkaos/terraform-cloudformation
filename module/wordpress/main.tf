resource "aws_key_pair" "key" {
  key_name_prefix = "${var.name}-"
  public_key      = var.public_key
  tags            = var.tags
}

resource "aws_cloudformation_stack" "stack" {
  name          = var.name
  tags          = var.tags
  template_body = file("${path.module}/WordPress_Bootstrap_AmazonLinux2.template")

  parameters = {
    DBName         = "wordpressdb"
    DBPassword     = "wordpressdb"
    DBRootPassword = "wordpressdb"
    DBUser         = "wordpressdb"
    InstanceType   = "t3.micro"
    KeyName        = aws_key_pair.key.id
    SSHLocation    = "0.0.0.0/0"
  }
}
