# niq_task

Assignment 1 -
--> Setting up a staging environment in Azure using Terraform involves defining infrastructure components such as virtual networks, subnets, compute resources (like virtual machines), storage, and potentially more based on your requirements. I have provide an example using Terraform to create a staging environment with a virtual network, subnet, and a virtual machine.

--> Used this staging_vm as an staging environment to build and deploy the .NET core application.

--> Create an encrypted secret to store the credentials. I have consumed this secret in the yaml. To access it, I have used ${{ AZURE_CREDENTIAL }}

--> Need to create an environment as STAGING
