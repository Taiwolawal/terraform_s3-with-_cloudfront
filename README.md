# Terraform S3 with Cloudfront
- In this project we will be working on deploying a static website to AWS Cloudfront using terraform
- The following steps are required:
- We will create an S3 bucket on AWS console for storing the statefile of the infrastructure we are setting up and reference it in backend.tf file.

![image](https://user-images.githubusercontent.com/50557587/199962484-25a3fd24-2b0e-49e5-938c-9c4d82f4056e.png)

- We wil be deploying our network application into an S3 bucket, so we need to create a S3 bucket, regulate access to our buckets and objects to private and block all public access to the bucket
