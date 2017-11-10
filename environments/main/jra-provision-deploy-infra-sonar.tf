# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infa-sonar-deploy" {
  depends_on = ["null_resource.infra-deploy-swarm-services"]

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} -e stack_file_dir=${var.ansible-deploy-infra-sonar-docker-compose-dir} -e stack_file_name=${var.ansible-deploy-infra-sonar-docker-compose-file} --private-key '${var.aws_key_path}' ${var.ansible-deploy-infra-sonar-playbook-file}"
  }
}
