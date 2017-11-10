# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infra-deploy-central-monitoring-services" {
  depends_on = ["null_resource.infra-configure-swarm-cluster"]

  # Wait 30 seconds to give all the monitoring services a chance to start up
  provisioner "local-exec" {
    command =  "echo *** About to 'deploy-central-monitoring-services':   waiting 30 seconds to allow for this previous step to finish:  'configure-swarm-cluster'..."
  }

  # Wait 30 seconds to give all the instances a chance to fully spin up and become available
  provisioner "local-exec" {
    command =  "sleep 30s"
  }

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} -e stack_file_dir=${var.ansible-deploy-infra-monitoring-services-docker-compose-dir} -e stack_file_name=${var.ansible-deploy-infra-monitoring-services-docker-compose-file} --private-key '${var.aws_key_path}' ${var.ansible-deploy-infra-monitoring-services-playbook-file}"
  }
}
