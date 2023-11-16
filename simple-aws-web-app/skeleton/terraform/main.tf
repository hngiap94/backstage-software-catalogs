data "aws_caller_identity" "current" {}

# amplify
module "amplify" {
  source         = "./modules/amplify"
}

# dynamodb
module "dynamodb" {
  source         = "./modules/dynamodb"
}

# lambda
module "lambda" {
  source         = "./modules/lambda"
  dynamodb_arn   = module.dynamodb.dynamodb_arn
  depends_on         = [module.dynamodb]
}

# gateway
module "gateway" {
  source         = "./modules/gateway"
  function_arn   = module.lambda.function_arn
  invoke_arn     = module.lambda.invoke_arn
  depends_on         = [module.lambda]
}
