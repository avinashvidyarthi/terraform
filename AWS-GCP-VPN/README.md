# Terraform project to create VPN tunnels between AWS and GCP

This Terraform project automates the setup of a highly available (HA) VPN connection
between a Google Cloud VPC network and an AWS VPC network. The VPN connection utilizes
IPsec to encrypt traffic between the two networks, ensuring secure communication
between your cloud environments.

### Architechture & Flow

![Diagram](https://storage.googleapis.com/do-whatever-you-want-here/aws_gcp_png.png)

This project will create the following resources:

- GCP HA VPN Gateway
- 2 x AWS Customer Gateway
- GCP Cloud Router
- GCP HA VPN Connection (4 Tunnels)
- GCP External Gateway
- 4 x GCP Cloud Router Interface
- AWS Virtual Private Gateway
- 2 x AWS S2S VPN Connection (4 Tunnels)
- 4 x GCP Cloud Router Peer (BGP Session)

### Prerequisites:

- Clone this repository
- Install & Setup an AWS-CLI profile with the Admin Access credentials.
- Install the 'gcloud' CLI and login using 'gcloud auth login'
- You GCP and AWS accounts should have the VPC and subnets created
- Create a 'terraform.tfvars' file by copying the contents of 'terraform.tfvars.example' file and replacing the values of the variables

### Usage:

- Run the 'terraform init' command to initilize the project
- Plan the terraform script using 'terrafom plan' & read the plan output carefully
- If everything seems right, apply the terraform code using 'terraform apply'

### Troubleshooting

If you encounter any problems, please consult the Terraform documentation or contact
the author

### License

This project is licensed under the MIT License

### Author

Avinash Kumar
Contact: avinashvidyarthi@gmail.com
