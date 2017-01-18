# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infa-apps-deploy" {
  depends_on = ["null_resource.swarm-cluster-provision"]

  # Wait 60 seconds to give all the instances a chance to fully spin up and become available
  provisioner "local-exec" {
    command =  "sleep 60s"
  }

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} --private-key '${var.aws_key_path}' ${var.ansible-provision-infra-app-playbook-file}"
  }
}
