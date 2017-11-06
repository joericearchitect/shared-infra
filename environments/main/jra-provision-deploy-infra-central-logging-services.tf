# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infra-deploy-central-logging-services" {
  depends_on = ["null_resource.swarm-cluster-provision"]

  # Wait 30 seconds to give all the logging services a chance to start up
  provisioner "local-exec" {
    command =  "echo waiting 30 seconds to allow time for the cluster nodes to join cluster..."
  }

  # Wait 30 seconds to give all the instances a chance to fully spin up and become available
  provisioner "local-exec" {
    command =  "sleep 30s"
  }

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} -e stack_file_dir=${var.ansible-deploy-infra-logging-services-docker-compose-dir} -e stack_file_name=${var.ansible-deploy-infra-logging-services-docker-compose-file} --private-key '${var.aws_key_path}' ${var.ansible-deploy-infra-logging-services-playbook-file}"
  }
}
