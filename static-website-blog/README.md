# README.md

## Description

This Terraform script deploys an AWS infrastructure for hosting a static website using Amazon S3 and CloudFront. The setup includes configuring S3 buckets, setting up public access controls, CloudFront distribution, and establishing access policies.

## Prerequisites

Make sure you have the following prerequisites before running the Terraform script:

- [Terraform](https://www.terraform.io/) installed.
- AWS credentials configured with appropriate permissions.
- The AWS profile named "test-aws" available in the AWS credentials file.

## Usage

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Review and customize variables in the `terraform.tfvars` file if necessary.

4. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

5. Confirm the changes by typing "yes" when prompted.

6. Once the deployment is complete, the static website will be accessible via the CloudFront distribution URL.

## Configuration

### `main.tf`

- Creates an S3 bucket for hosting the static website.
- Configures public access block settings for the S3 bucket.
- Sets up CloudFront origin access control for S3.
- Creates a CloudFront distribution with specified settings.


## Clean Up

To avoid incurring charges, run the following command to destroy the resources created:

```bash
terraform destroy
```

Confirm the destruction by typing "yes" when prompted.

## Notes

- Ensure that your AWS credentials are properly configured, and the specified profile ("test-aws") has the necessary permissions.
- The CloudFront distribution may take some time to propagate changes after deployment.

Feel free to reach out to the repository owner for any issues or further assistance.