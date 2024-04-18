# Example single node AppStack cluster with single nic and new VPC and new subnet

This example instantiates:

- Appstack cluster with single master and no worker node
- needs api token
gcloud compute images create rhel9-20240216075746-voltstack-combo-us --family rhel9 --source-uri gs://ves-images/rhel9-20240216075746-voltstack-combo.tar.gz