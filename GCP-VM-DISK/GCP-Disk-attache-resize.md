## How to Create Virtual Machine Instance on Google Cloud plaform

## Launching a Google Cloud Virtual Machine

You can launch a virtual machine (which we will generally refer to as a VM) from:

- **Web-based Google Cloud Console**
- **Command line interface (CLI) using the Google Cloud SDK**
- **Terraform IAC**


## Prerequisites
- Enable the following APIs in your Google Cloud Project:
- Google Compute Engine
- Google Cloud Storage

## Steps [here](https://cloud.google.com/compute/docs/instances/create-start-instance)
- **Login to GCP Console**
- **Select your Project**
- **Open Cloud shell** and run the below command

```CreateVM
#Create Instance from Command line
gcloud compute instances create instance-1 \
    --project=rvgcp108 \
    --zone=us-west1-a \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=asiaeast1subnet01 \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=terraform@rvgcp108.iam.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server,lb-health-check \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/centos-cloud/global/images/centos-7-v20240110,mode=rw,size=20,type=projects/rvgcp108/zones/us-west1-a/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any


#check instance from command line
gcloud compute instances list
```

### Create Additional Persistence disk 

- **Check disk type** [here](https://cloud.google.com/compute/docs/disks/add-persistent-disk#formatting)
``` 
example command:
#gcloud compute instances attach-disk gcelab --disk mydisk --device-name <YOUR_DEVICE_NAME> --zone $ZONE


gcloud compute disk-types list --filter="zone:( us-west1-a us-west1-b )"

gcloud compute disks create demo-disk-2 --type=pd-standard --device-name=Google_PersistentDisk_persistent-demo-disk-2 --size=100GB --zone=us-west1-a

gcloud compute disks delete disk-1 --zone=us-west1-a
```
## Attache disk to VM Instance
```
gcloud compute instances attach-disk instance-1 --disk demo-disk-2  --zone=us-west1-a

```

## SSH into Instance and Format that disk and Mount on Operating system
```
gcloud compute ssh <VM_NAME>

gcloud compute ssh instance-1 --zone us-west1-a

#############
ls -l /dev/disk/by-id/

sudo mkfs.ext4 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/disk/by-id/scsi-0Google_PersistentDisk_persistent-demo-disk-2

sudo fdisk -l

sudo mkdir /demo-disk2

sudo mount -o discard,defaults /dev/disk/by-id/scsi-0Google_PersistentDisk_persistent-demo-disk-2 /demo-disk2

sudo df -HPT
```


## Detach a Persistent Disk
```
sudo umount /demo-disk2
df -HPT
exit

gcloud compute instances detach-disk instance-1 --disk /dev/disk/by-id/scsi-0Google_PersistentDisk_persistent-demo-disk-2 --zone us-west1-a 

gcloud compute disks delete demo-disk-2 --zone=us-west1-a
```

## Delete VM Instance
```
gcloud compute instances delete instance-1 --zone us-west1-a
```

