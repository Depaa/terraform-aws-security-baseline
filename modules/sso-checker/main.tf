locals {
  sso_instance_arn = try(tolist(data.aws_ssoadmin_instances.this.arns)[0], "")
}

resource "null_resource" "check_sso_enabled" {
  provisioner "local-exec" {
    command     = <<EOT
      if [ "${local.sso_instance_arn}" = "" ]; then
        echo "SSO is not enabled. Please enable SSO in your AWS account."
        exit 1
      else
        echo "SSO is enabled. Proceeding with deployment."
      fi
    EOT
    interpreter = ["/bin/sh", "-c"]
  }

  triggers = {
    sso_instance_arn = local.sso_instance_arn
  }
}
