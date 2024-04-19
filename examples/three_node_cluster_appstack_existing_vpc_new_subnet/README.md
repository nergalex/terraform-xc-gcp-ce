# Example three node AppStack cluster with single nic and existing VPC and new subnet

This example instantiates:

- AppStack cluster with three master and three worker nodes
- GCP compute instance template master nodes
- GCP compute instance template worker nodes
- GCP compute region instance group manager master nodes
- GCP compute region instance group manager worker nodes
- GCP compute instance master
- GCP compute instance worker
- GCP compute subnetwork for SLO master 
- GCP compute subnetwork for SLO worker
- GCP compute firewall for SLO master
- GCP compute firewall for SLO worker
- SLO interface with NAT IP

# Usage

- needs api token
- To deploy this example, GCP VPC for SLO interface is required in advance and in particular its name
- Prepare GPC instance image
  * To be able to start a GCP VM instance, we need an instance image. This image must be saved in the Project Storage
  * Follow instructions at [F5 XC GCP Image Download](https://docs.cloud.f5.com/docs/images/node-cloud-images#gcp)  
  * Example: gcloud compute images create rhel9-20240216075746-voltstack-combo-us --family rhel9 --source-uri gs://ves-images/rhel9-20240216075746-voltstack-combo.tar.gz
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