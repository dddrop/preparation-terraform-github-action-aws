output "oidc_arn" {
  value = aws_iam_openid_connect_provider.github_actions.arn
}

output "thumbprint" {
  value = aws_iam_openid_connect_provider.github_actions.thumbprint_list
}