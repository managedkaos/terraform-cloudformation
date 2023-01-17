resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  public_key = tls_private_key.key.public_key_openssh
  tags       = var.tags

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ${path.root}/key.pem && chmod 600 ${path.root}/key.pem"
  }
}
