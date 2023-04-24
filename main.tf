## Variables

## IAM

# Search for the SSO AWS admin role (to add it to k8s aws-auth ConfigMap for example)
data "aws_iam_roles" "aws_reserved_sso_awsadministratoraccess" {
  name_regex  = "AWSReservedSSO_AWSAdministratorAccess_.*"
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

data "aws_iam_roles" "aws_reserved_sso_awspoweruseraccess" {
  name_regex  = "AWSReservedSSO_AWSPowerUserAccess_.*"
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

data "aws_iam_roles" "aws_reserved_sso_awsreadonlyaccess" {
  name_regex  = "AWSReservedSSO_AWSPowerUserAccess_.*"
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

locals {

  aws_reserved_sso_awsadministratoraccess = [
    for parts in [for arn in data.aws_iam_roles.aws_reserved_sso_awsadministratoraccess.arns : split("/", arn)] :
    format("%s/%s", parts[0], element(parts, length(parts) - 1))
  ][0]

  aws_reserved_sso_awspoweruseraccess = [
    for parts in [for arn in data.aws_iam_roles.aws_reserved_sso_awspoweruseraccess.arns : split("/", arn)] :
    format("%s/%s", parts[0], element(parts, length(parts) - 1))
  ][0]

  aws_reserved_sso_awsreadonlyaccess = [
    for parts in [for arn in data.aws_iam_roles.aws_reserved_sso_awsreadonlyaccess.arns : split("/", arn)] :
    format("%s/%s", parts[0], element(parts, length(parts) - 1))
  ][0]

}

output "aws_reserved_sso_awsadministratoraccess" {
  value = local.aws_reserved_sso_awsadministratoraccess
  description = "AWSReservedSSO_AWSAdministratorAccess"
}

output "aws_reserved_sso_awspoweruseraccess" {
  value = local.aws_reserved_sso_awspoweruseraccess
  description = "AWSReservedSSO_AWSPowerUserAccess"
}

output "aws_reserved_sso_awsreadonlyaccess" {
  value = local.aws_reserved_sso_awsreadonlyaccess
  description = "AWSReservedSSO_AWSPowerUserAccess"
}

output "namespace" {
  value = module.this.namespace
}

output "environment" {
  value = module.this.environment
}

output "tenant" {
  value = module.this.tenant
}

output "stage" {
  value = module.this.stage
}

output "name" {
  value = module.this.name
}

output "tags" {
  value = module.this.tags
}

output "this" {
  value = module.this.context
}

output "label_order" {
  value = module.this.label_order
}

output "label_id" {
  value = module.this.id
}

