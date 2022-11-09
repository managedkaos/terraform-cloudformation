resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name_prefix = "${var.name}-"
  public_key      = tls_private_key.key.public_key_openssh
  tags            = var.tags

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./${path.module}/${var.name}.pem && chmod 600 ${path.module}/${var.name}.pem"
  }
}

resource "aws_cloudformation_stack" "stack" {
  name         = var.name
  tags         = var.tags
  template_url = coalesce(var.template_url, "https://s3-${var.name}.amazonaws.com/cloudformation-templates-${var.name}/WordPress_Single_Instance.template")

  parameters = {
    DBName         = "wordpressdb"
    DBPassword     = "wordpressdb"
    DBRootPassword = "wordpressdb"
    DBUser         = "wordpressdb"
    InstanceType   = "t2.small"
    KeyName        = aws_key_pair.key.id
    SSHLocation    = "0.0.0.0/0"
  }

}
