resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = ["jenkins", "http-server"]
	boot_disk {
		initialize_params {
			image = "${var.image}"
		}
	}
	network_interface {
		network = "${var.network}"
		access_config {
			// Ephemeral IP
		}
	}
	metadata {
		sshKeys = "${var.ssh_user}:${file("${var.public_key}")}"
	}
	connection = {
		type = "ssh"
		user = "${var.ssh_user}"
		private_key = "${file("${var.private_key}")}"
	}
	provisioner "remote-exec" {
		inline = [
			"sudo yum install -y java"
		]
	}
	provisioner "remote-exec" {
		scripts = [
			"${var.scripts}"
		]
	}
}
