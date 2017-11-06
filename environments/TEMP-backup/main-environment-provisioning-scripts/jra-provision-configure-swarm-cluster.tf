# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infra-configure-swarm-cluster" {
  depends_on = ["null_resource.infra-deploy-central-logging-services"]

  # Wait 180 seconds to give all the logging services a chance to start up
  provisioner "local-exec" {
    command =  "echo waiting 180 seconds to allow time for the logging services start up..."
  }

  # Wait 180 seconds to give all the instances a chance to fully spin up and become available
  provisioner "local-exec" {
    command =  "sleep 180s"
  }

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} --private-key '${var.aws_key_path}' ${var.ansible-configure-swarm-cluster-playbook-file}"
  }
}
