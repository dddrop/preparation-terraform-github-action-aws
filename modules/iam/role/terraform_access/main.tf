# https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services
resource "aws_iam_role" "github_actions_for_terraform" {
  name = "github-actions-for-terraform"
  assume_role_policy = templatefile("${path.module}/role_policy/github_actions_for_terraform.json", {
    oidc_arn     = var.oidc,
    organization = var.organization,
    repository   = var.repository,
    environment  = var.environment,
  })
}

resource "aws_iam_policy" "terraform_resource_access" {
  name = "terraform-resource-access"
  policy = templatefile("${path.module}/policy/terraform_resource_access.json", {})
}

resource "aws_iam_role_policy_attachment" "terraform_access" {
  role       = aws_iam_role.github_actions_for_terraform.name
  policy_arn = aws_iam_policy.terraform_resource_access.arn
}