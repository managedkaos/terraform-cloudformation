module "us-east-1" {
  source       = "./${path.module}/../wordpress"
  name         = "us-east-1"
  environment  = "development"
  template_url = "https://s3.amazonaws.com/cloudformation-templates-us-east-1/WordPress_Single_Instance.template"
}

module "us-east-2" {
  source      = "./${path.module}/../wordpress"
  name        = "us-east-2"
  environment = "development"
}

module "us-west-1" {
  source      = "./${path.module}/../wordpress"
  name        = "us-west-1"
  environment = "development"
}

module "us-west-2" {
  source      = "./${path.module}/../wordpress"
  name        = "us-west-2"
  environment = "development"
}
