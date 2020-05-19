resource "null_resource" "wait_for_server" {
  provisioner "local-exec" {
    command = format("until curl --silent %s; do sleep 15; done", google_compute_instance.quakejs.network_interface.0.access_config.0.nat_ip)
    interpreter = ["/bin/bash", "-c"]
  }
}