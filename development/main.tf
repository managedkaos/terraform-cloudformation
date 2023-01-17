module "us-east-1" {
  source       = "../module"
  name         = "us-east-1"
  environment  = "development"
  template_url = "https://s3.amazonaws.com/cloudformation-templates-us-east-1/WordPress_Single_Instance.template"
  providers = {
    aws = aws.us-east-1
  }
}

module "us-east-2" {
  source      = "../module"
  name        = "us-east-2"
  environment = "development"
  providers = {
    aws = aws.us-east-2
  }
}

module "us-west-1" {
  source      = "../module"
  name        = "us-west-1"
  environment = "development"
  providers = {
    aws = aws.us-west-1
  }
}

module "us-west-2" {
  source      = "../module"
  name        = "us-west-2"
  environment = "development"
  providers = {
    aws = aws.us-west-2
  }
}
