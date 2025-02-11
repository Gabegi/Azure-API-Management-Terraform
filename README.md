# Azure-API-Management-Terraform

This repository provides code examples that are explained in this blog [Azure APIM Using Terraform](https://medium.com/@codebob75/azure-apim-using-terraform-f439e93bb4f1)

You might also want to check out my Terraform APIM Module to automate Azure APIM resource creation [Azure APIM Terraform Module](https://github.com/Gabegi/Azure_APIM_Resources_Terraform_Module)

To use this code, first create a tfvars file with your subscription key in the folder vars.
Then, navigate to the repo and run:
- terraform init
- terraform plan -var-file="vars/values.tfvars"
- terraform apply -auto-approve -var-file="vars/values.tfvars" 
- terraform destroy -var-file="vars/values.tfvars"