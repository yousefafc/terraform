.PHONY = terraform-init jenkins-apply jenkins-destroy python-systemd-http-server-apply python-systemd-http-server-destroy
VAR_DIR = "variables"
TERRAFORM_APPLY = "terraform apply -auto-approve -var-file="
TERRAFORM_DESTROY = "terraform destroy -auto-approve -var-file="

terraform-init:
	@terraform init

jenkins-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/jenkins.tfvars

jenkins-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/jenkins.tfvars

golang-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/golang.tfvars

golang-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/golang.tfvar
