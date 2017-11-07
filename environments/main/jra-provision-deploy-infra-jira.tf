# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infa-jira-deploy" {
  depends_on = ["null_resource.infa-apps-deploy"]

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} --private-key '${var.aws_key_path}' ${var.ansible-deploy-infra-jira-services-playbook-file}"
  }
}