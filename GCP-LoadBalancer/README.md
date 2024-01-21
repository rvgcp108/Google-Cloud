# Google Cloud Load Balancer
## Agenda for reading this page
To know crisp and precise information about Google cloud Load balancer and use case

# Topic:
- What is Load Balancer in Google Cloud
- Type of Load Balancers in GCP
- Create VPC in GCP
- Create Subnets
- Create Instance Group
- Create Intance template
- Create healthcheck of Instance
- Ceate Load Balancer
- Create webpage to test the Load Balancer working as aspected
- Destroy the setup to save the bill

# What is Load Balancer in Google Cloud
- A load balancer distributes user traffic across multiple instances of your applications. By spreading the load.
- Load balancing reduces the risk that your applications experience performance issues. Google's Cloud Load Balancing is built on reliable, high-performing technologies such as Maglev, Andromeda, Google Front Ends, and Envoy—the same technologies that power Google's own products.

[![For More Details]](https://cloud.google.com/load-balancing/docs/load-balancing-overview)

# Types of Google Cloud load balancers
# 1.Application Load Balancers
- External Application Load Balancers 
- Internal Application Load Balancers

![alt text](https://cloud.google.com/static/load-balancing/images/application-load-balancer.svg)

# 2.Network Load Balancers

![alt text](https://cloud.google.com/static/iam/img/policy-inheritance.svg)

# 3.Proxy Network Load Balancers
External proxy Network Load Balancers
Internal proxy Network Load Balancers 
![alt text](https://cloud.google.com/static/load-balancing/images/proxy-network-load-balancer.svg)

# 4.Passthrough Network Load Balancers
External passthrough Network Load Balancers 
Internal passthrough Network Load Balancers
![alt text](https://cloud.google.com/static/load-balancing/images/passthrough-network-load-balancer.svg)

# Create VPC in GCP
```vpc Creation
gcloud compute networks create rvgcpvpc01 --project=rvgcp108 --description=rvgcpvpc01 --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional
```
# Create Subnets
```
gcloud compute networks subnets create asiaeast1subnet01 --project=rvgcp108 --description=asiaeast1subnet01 --range=10.0.0.0/24 --stack-type=IPV4_ONLY --network=rvgcpvpc01 --region=asia-east1

# Create second subnet in another region in GCP
gcloud compute networks subnets create asiaeast2subnet02 --project=rvgcp108 --description=asiaeast2subnet02 --range=10.0.2.0/24 --stack-type=IPV4_ONLY --network=rvgcpvpc01 --region=asia-east1
```
# List out created VPC , subnets and Firewall rules
```
gcloud compute networks list
gcloud compute networks subnets list
gcloud compute firewall-rules describe
gcloud compute firewall-rules describe rvgcpvpc01-allow-icmp
```
# Create Instance Group

# Create Intance template
# Create healthcheck of Instance
# Ceate Load Balancer
# Create webpage to test the Load Balancer working as aspected
# Destroy the setup to save the bill

Thanks for  reading this page

working on it
