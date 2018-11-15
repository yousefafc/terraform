provider "google" {
	credentials = "${file("~/terraform_key.json")}"
	project = "the-dock-219509"
	region = "europe-north1"

}

