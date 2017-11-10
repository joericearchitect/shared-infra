# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "infra-deploy-swarm-services" {
  depends_on = ["null_resource.infra-deploy-central-monitoring-services"]

  # Wait 10 seconds to give all the logging services a chance to start up
  provisioner "local-exec" {
    command =  "echo *** About to 'deploy-swarm-services':   waiting 10 seconds to allow for this previous step to finish:  'deploy-central-monitoring-services'..."
  }

  # Wait 10 seconds to give time for the monitoring services to become available
  provisioner "local-exec" {
    command =  "sleep 10s"
  }

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e env_domain_prefix=${var.environment-domain-prefix} -e stack_file_dir=${var.ansible-deploy-infra-logging-services-docker-compose-dir} -e stack_file_name_infra_proxies=${var.ansible-provision-infra-app-docker-compose-file-infra-proxies} -e stack_file_name_app_proxies=${var.ansible-provision-infra-app-docker-compose-app-proxies} -e stack_file_name_docker_services=${var.ansible-provision-infra-app-docker-compose-file-docker-services} --private-key '${var.aws_key_path}' ${var.ansible-provision-infra-app-playbook-file}"
  }
}
