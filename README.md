# Vault Kubernetes Installation
This directory contains a Kubernetes chart and terraform that uses the Helm provider to deploy an Open Source version of the Hashicorp Vault server.  It deploys Vault and Wetty, per student

```
git clone https://github.com/johndohoneyjr/kubernetes-vault-installation.git
cd pod-deployment

Make sure to change the enrollment to match the number of students, and the student list to match the class roster.  Save variables.tf, then perform the terraform operations to deploy

terraform init
terraform apply
```

To Destroy the class
```
terraform destroy
```

