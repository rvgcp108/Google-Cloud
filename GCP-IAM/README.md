# Google Cloud IAM overview

 _IAM lets you grant granular access to specific Google Cloud resources and helps prevent access to other resources._
[![For More Details]](https://cloud.google.com/iam/docs/overview)


# IAM stand for: Identity Access Management

## Identity = who, Who can be 
                - Google account
                - Google group
                - Google workspace
                - Service account
                - Cloud Identitiy domain
                - Authenticated Users
                - All user (who all available on the Internet)
## Access = Roles(permissions)

## Management = Resources

## _How IAM works_

## Manage access control
- by defining who (identity) has what access (role) for which resource. Example Compute Engine virtual machine instances, Google Kubernetes Engine (GKE) clusters, and Cloud Storage buckets  
## Permission to access a resource
- isn't granted directly to the end user. 
- Permissions are grouped into roles, and roles are granted to authenticated principals.

## Google Cloud IAM Principles:
- Google Account : users, email ID etc.
- Service Account
- Google Group
- Workspace
- Cloud identity domain
- All Authenticated users
- All users

## IAM Roles 
A role contains a set of permissions that allows you to perform specific actions on Google Cloud resources.
![alt text](https://cloud.google.com/static/iam/img/role-and-permissions.svg)

## IAM Roles Types:
There are three types of roles in IAM:
## Basic roles:
Basic roles, which include the Owner, Editor, Viewer, Billing Admin and Browser roles.
## Predefined roles
Which provide granular access for a specific service and are managed by Google Cloud.
## Custom roles
Which provide granular access according to a user-specified list of permissions.
## Allow policy
- also known as an IAM policy, defines and enforces what roles are granted to which principals. 
Each allow policy is attached to a resource. When an authenticated principal attempts to access a resource, IAM checks the resource's allow policy to determine whether the action is permitted.
![alt text](https://cloud.google.com/static/iam/img/iam-overview-policy.svg)

##  Google Cloud resource hierarchy example
![alt text](https://cloud.google.com/static/iam/img/policy-inheritance.svg)

Thanks for reading.
