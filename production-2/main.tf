resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "null_resource" "key" {
  triggers = {
    key = tls_private_key.key.public_key_openssh
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ${path.root}/key.pem && chmod 600 ${path.root}/key.pem"
  }
}

module "us-east-1" {
  source      = "../module/wordpress"
  name        = "us-east-1"
  environment = "development"
  public_key  = tls_private_key.key.public_key_openssh
  providers = {
    aws = aws.us-east-1
  }
}

module "us-east-2" {
  source      = "../module/wordpress"
  name        = "us-east-2"
  environment = "development"
  public_key  = tls_private_key.key.public_key_openssh
  providers = {
    aws = aws.us-east-2
  }
}

module "us-west-1" {
  source      = "../module/wordpress"
  name        = "us-west-1"
  environment = "development"
  public_key  = tls_private_key.key.public_key_openssh
  providers = {
    aws = aws.us-west-1
  }
}

module "us-west-2" {
  source      = "../module/wordpress"
  name        = "us-west-2"
  environment = "development"
  public_key  = tls_private_key.key.public_key_openssh
  providers = {
    aws = aws.us-west-2
  }
}
