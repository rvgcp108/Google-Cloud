# Google Cloud NAT Gateway
## Agenda for reading this page
To know crisp and precise information about Google cloud NAT Gateway and use case

# Topic:
- What is Nat Gateway in Google Cloud
- Ceate NAT Gateway
- Create Virtual Instance in private subnets
- Provide Internet acces to the Private subnet's instance

# What is Nat Gateway in Google Cloud
- Google Cloud VPC or Virtual Private Cloud provides networking functionality for your cloud-based resources and services.
- A virtual private cloud (VPC) is a secure, isolated private cloud hosted within a public cloud. Customers can run code, store data, host websites etc.

[![For More Details]](https://https://cloud.google.com/vpc/docs/overview)

# What is NAT gateway used for?
A NAT gateway is a Network Address Translation (NAT) service. You can use a NAT gateway so that instances in a private subnet can connect to services outside your VPC but external services cannot initiate a connection with those instances.

# Create a VPC from command line
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
# Create two Instance per subnets
```
```

# Check Internet connectivity of instance

# Create Nat Gateway


Thanks for  reading this page

working on it.
