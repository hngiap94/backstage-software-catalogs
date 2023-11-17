resource "aws_amplify_app" "hello_world_app" {
  name       = "aws-simple-web-app"
  repository = "https://github.com/hngiap94/aws-amplify-hello-world"
  access_token = var.access_token
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        build:
          commands:
            - echo "build frontend"
      artifacts:
        baseDirectory: src
        files:
          - '**/*'
  EOT
}

resource "aws_amplify_branch" "main" {
  app_id  = aws_amplify_app.hello_world_app.id
  branch_name = "main"
}