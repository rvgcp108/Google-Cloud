## GCP Kubernete Cluster and Deploy Wordpress application [here](https://cloud.google.com/kubernetes-engine/docs/tutorials/persistent-disk)

Pre-requisites:
- In the Google Cloud console, on the project selector page,
- In the Google Cloud console, activate Cloud Shell.
- In the Google Cloud console, activate Cloud Shell.

- In Cloud Shell, **enable the GKE and Cloud SQL Admin APIs**
```
gcloud services enable container.googleapis.com sqladmin.googleapis.com
```


## Setting up environment for GKE
```
gcloud config set compute/region us-west1
```

## Set the PROJECT_ID environment variable to your project ID (project-id).
```
export PROJECT_ID=rvgcp109
```

## Download sample application from Github
```
git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples

cd kubernetes-engine-samples
```

## Set the WORKING_DIR environment variable
```
WORKING_DIR=$(pwd)
```

## Create a GKE cluster
- GKE cluster named `persistent-disk-demo`
```
CLUSTER_NAME=persistent-disk-demo
gcloud container clusters create $CLUSTER_NAME --num-nodes 1 \
--network=rvgcpvpc01 --subnetwork=asiaeast1subnet01 --disk-type pd-standard
```

- **Once Cluster created, connect to your new cluster**
```
gcloud container clusters get-credentials $CLUSTER_NAME --region us-west1
```

## Creating a PV and a PVC 
```
cd kubernetes-engine-samples/quickstarts/wordpress-persistent-disks

WORKING_DIR=$(pwd)

kubectl apply -f $WORKING_DIR/wordpress-volumeclaim.yaml

kubectl get persistentvolumeclaim
```


## Creating a Cloud SQL for MySQL instance
```
INSTANCE_NAME=mysql-wordpress-instance
gcloud sql instances create $INSTANCE_NAME
```
## Add the instance connection name as an environment variable
```
export INSTANCE_CONNECTION_NAME=$(gcloud sql instances describe $INSTANCE_NAME \
    --format='value(connectionName)')
```

## Create a database for WordPress to store its data
```
gcloud sql databases create wordpress --instance $INSTANCE_NAME
```

## Create a database `wordpress` and set a password for WordPress to authenticate to the instance
- **Note** If you close your Cloud Shell session, you lose the password. Make a note of the password because you need it later in demo
```fxPr0XsuBdjJ16k+tUaX5aI7
CLOUD_SQL_PASSWORD=$(openssl rand -base64 18)
gcloud sql users create wordpress --host=% --instance $INSTANCE_NAME \
    --password $CLOUD_SQL_PASSWORD

echo  $CLOUD_SQL_PASSWORD --> Get password
```

## Deploying WordPress 
- **Configure a service account and create secrets**
```
SA_NAME=cloudsql-proxy
gcloud iam service-accounts create $SA_NAME --display-name $SA_NAME
```
- **Add the service account email address as an environment variable**
```
SA_EMAIL=$(gcloud iam service-accounts list \
    --filter=displayName:$SA_NAME \
    --format='value(email)')
```

- **Add the cloudsql.client role to your service account**
```
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --role roles/cloudsql.client \
    --member serviceAccount:$SA_EMAIL
```


- **Create a key for the service account**
- **Note** Below command downloads a copy of the `key.json` file
```
gcloud iam service-accounts keys create $WORKING_DIR/key.json \
    --iam-account $SA_EMAIL 
```
```Output
rv579@cloudshell:~/kubernetes-engine-samples/quickstarts/wordpress-persistent-disks (rvgcp109)$ gcloud iam service-accounts keys create $WORKING_DIR/key.json \
    --iam-account $SA_EMAIL
created key [ab692d06c2e9c4da08f2526c1a55cb9e6d8d] of type [json] as [/home/rv579798/kubernetes-engine-samples/quickstarts/wordpress-persistent-disks/key.json] for [cloudsql-proxy@rvgcp109.iam.gserviceaccount.com]
```

- **Create a secret for the MySQL credentials**
```fxPr0XsuBdjJ16k+tUaX5aI7
kubectl create secret generic cloudsql-db-credentials \
    --from-literal username=wordpress \
    --from-literal password=$CLOUD_SQL_PASSWORD
```

- **Create a Kubernetes secret for the service account credentials**
```
kubectl create secret generic cloudsql-instance-credentials \
    --from-file $WORKING_DIR/key.json
```

## Finaly Deploy WordPress
- **replacing the INSTANCE_CONNECTION_NAME environment variable**
```
cat $WORKING_DIR/wordpress_cloudsql.yaml.template | envsubst > \
    $WORKING_DIR/wordpress_cloudsql.yaml
```
- **Deploy the wordpress_cloudsql.yaml manifest file**
```
kubectl create -f $WORKING_DIR/wordpress_cloudsql.yaml
```

- **Watch the deployment to see the status change to running**
```
kubectl get pod -l app=wordpress --watch
```

## Expose the WordPress service
- **Create a Service type: LoadBalancer**
```
kubectl create -f $WORKING_DIR/wordpress-service.yaml
```

- **Watch the deployment and wait for the service to have an external IP address assigned**
```
kubectl get svc -l app=wordpress --watch
```

- **Make a note of the `EXTERNAL_IP` address field to use later**

## Setting up your WordPress blog
- **In your browser open with the EXTERNAL_IP address**
```
http://34.82.130.12
```
- On the WordPress installation page, **select a language, and then click Continue**
- Complete the Information needed page, and then **click Install WordPress**
- **Click Log In**.
- Enter the username and password that you previously created.
- You now have a blog site. To visit your blog, in your browser, go to the following URL:


## Time to Clean up
- **Delete the project**
- **Delete the individual resources**
- **Delete the service**
```
kubectl delete service wordpress
```
- **Delete the Deployment**
```
kubectl delete deployment wordpress
```
- **Delete the PVC for WordPress**
```
kubectl delete pvc wordpress-volumeclaim
```
- **Delete the GKE cluster**
```
gcloud container clusters delete $CLUSTER_NAME
```
- **Delete the Cloud SQL instance**
```
gcloud sql instances delete $INSTANCE_NAME
```
- **Remove the role from the service account**
```
gcloud projects remove-iam-policy-binding $PROJECT_ID \
    --role roles/cloudsql.client \
    --member serviceAccount:$SA_EMAIL
```
- **Delete the service account**
```
gcloud iam service-accounts delete $SA_EMAIL
```

## Thanks for Great Learning.....














