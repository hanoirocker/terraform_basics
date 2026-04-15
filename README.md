<p align="center">
  <img src="https://raw.githubusercontent.com/hashicorp/terraform-website/master/public/img/logo-text.svg" alt="Terraform Logo" width="500">
</p>

# Terraform basics

## Resources

For this example we'll build a basic Nginx server.
The idea is for everyone to be able to execute only terraform commands in order to set the infra, avoiding
possible errors produced while trying to create docker containers, etc ..

## Terraform State

Currently managed on local. AWS, GCP and Terraform Cloud providers could be used as managers for this state files if needed.
