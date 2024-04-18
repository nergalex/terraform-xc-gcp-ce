# Example Single node single NIC existing VPC existing subnet

This example instantiates:

- Single node CE cluster
- GCP compute instance template
- GCP compute region instance group manager
- GCP compute instance
- GCP compute subnetwork for SLO
- GCP compute subnetwork for SLI
- GCP compute firewall for SLO
- GCP compute firewall for SLI
- SLO interface with NAT IP

# Usage

- To deploy this example, GCP VPC and subnetwork for SLO interface are required in advance and in particular their names
- Prepare GPC instance image
  * To be able to start a GCP VM instance, we need an instance image. This image must be saved in the Project Storage
  * Follow instructions at [F5 XC GCP Image Download](https://docs.cloud.f5.com/docs/images/node-cloud-images#gcp)  
  * Example: gcloud compute images create rhel9-20240216075746-single-voltmesh-us --family rhel9 --source-uri gs://ves-images/rhel9-20240216075746-single-voltmesh.tar.gz
  * Name of the created image will later on be used as input variable for Terraform
- Authentication can be done in different ways as outlined here: [Google Provider Authentication](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication)
- In this example we use gcloud command to authenticate. Run `gcloud auth application-default login`
- Export GCP_PROJECT_ID with: `export TF_VAR_gcp_project_id="gcp_project_name"`
- Export F5 XC API certificate password with: 
  * `export VES_P12_PASSWORD="p12 password"`
  * `export TF_VAR_f5xc_api_p12_cert_password="$VES_P12_PASSWORD"` 
- Edit `terraform.tfvars` file to align with your environment
- Copy F5XC API certificate file obtained in installation step into example directory
- Initialize with: `terraform init`, optionally run `terraform plan`
- Apply with: `terraform apply -auto-approve` or destroy with: `terraform destroy -auto-approve`