# Google Cloud VPC (Virtual Private Cloud)
## Agenda for reading this page
To know crisp and precise information about Google cloud VPC

# What is Google Cloud VPC (overview)
- Google Cloud VPC or Virtual Private Cloud provides networking functionality for your cloud-based resources and services.
- A virtual private cloud (VPC) is a secure, isolated private cloud hosted within a public cloud. Customers can run code, store data, host websites etc.

[![For More Details]](https://https://cloud.google.com/vpc/docs/overview)

# VPC Networks
- In Google Cloud VPC network is a global resource.
- AVPC consists list of regional virtual subnetworks (subnets) in data centers, all connected by a global wide area network. 
- VPC networks are logically isolated from each other in Google Cloud.
- A VPC network (Google Virtual Private Cloud network) is very similar to a physical network but it is virtualized within the Google Cloud Platform (GCP).
## What is the maximum number of VPC in GCP?
The default limit for number of networks (such as a VPC) per project is 15. To check your quota, run this command with your project ID: 
```#gcloud compute project-info describe --project <YOUR_PROJECT_ID>```
## What is the cidr range for GCP VPC
You can create a VPC network with a subnet that has 10.0.0.0/8 which works just fine. While the smallest possible subnet is a /29

# Subnets
- Subnets are regional resources in Google Cloud.
- A subnet is a range of IP addresses in your VPC
## Subnets example
![alt text](https://cdn.networkmanagementsoftware.com/wp-content/uploads/gcp-subnet-zones-1024x567.png)

## VPC network example
![alt text](https://cloud.google.com/static/vpc/images/vpc-overview-example.svg)
  
# How to Create VPC in Google Cloud
- Auto mode - When we select auto mode to create VPC , Google cloud create a VPC globaly and create subnets in all available regions with same IP range.
- Cutom mode - As per use case we create a VPC and required subnets in specific regions.

# Create a VPC command line
```  
#gcloud compute networks create rvgcpvpc --project=rvgcpvpc --description=rvgcpvpc --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional
```

# Create sbunets
```
# Create Subnet1:
#gcloud compute networks subnets create asiaeast1subnet01 --project=rvgcpvpc --description=asiaeast1subnet01 --range=10.0.0.0/24 --stack-type=IPV4_ONLY --network=rvgcpvpc01 --region=asia-east1

# Create Subnet2:
#gcloud compute networks subnets create asiaeast2subnet02 --project=rvgcpvpc --description=asiaeast2subnet02 --range=10.0.1.0/24 --stack-type=IPV4_ONLY --network=rvgcpvpc01 --region=asia-east2
```
Thanks for  reading this page

