## how to connect Google cloud platform with Terraform(IAC)
- **Step1.** Login to GCP console and create a Project
<p align="center">
  <img src="./images/How_to_create_project_gcp.png" width="600" title="Architecture" alt="Architecture">
</p>
- **Step2.** Create a service account , activate the key and download the key in safe place
<p align="center">
  <img src="./images/gc-activate-key.png" width="600" title="Architecture" alt="Architecture">
</p>
- **Step3.** Configure key with Terraform
```Example
key name: sa_demo.json
{
  "type": "service_account",
  "project_id": "rvgcp1000",
  "private_key_id": "2d6748e6a17184a0a323d70jkjflsdjfoiqwueoiruwieuroiweuro",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCuW9iKHNz0s7zl\nrSsp4CuuovS5XPK/oevvHaCsPicYUT3QzqE3khfcJ57M3DQgpdhBg3L/heZJilmz\nSQ1Ytut1+u1/V9DmwFaGHSF2OER+2NzV9zxOtILL5RWiUEpk+37sOWqY3tkyLMSu\nDgPBVJjh+0H2t4KirIS1paTPDRmXHFXMdZNXntt8sENhsjeLxPwHehXprdyPeMIZ\ngE49dcLnR/Vnb8MVA+3mOlhCF81XVApCxFzi2iad+Z82UXcWxgh0YJLjvFOJm4pD\nzUnPXstD1u70zam2Pq5qAQxWW6LI8FixWPF7yc8OUtbOgQuNUUkSvso2r4tlRnJW\n2plkaKtHAgMBAAECggEAE27wOSCTbgC0fqLo6y9tnvbRsPFPqxU4jzuto1UAFYFE\nkwfcxy1U1HhkBjBK7RKfAlpM0HcTnkG50rZDMw6cOtefbfCTO4zXd/Y6Owt1cu/n\n2T9HrPwIkgI0AZXSXOP9FwYlP+mi=\n-----END PRIVATE KEY-----\n",
  "client_email": "terraform@rvgcp1000.iam.gserviceaccount.com",
  "client_id": "1062658045382347927592739749273",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/terraform%40rvgcp1000.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

vim provider.tf

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.13.0"
    }
  }
}

provider "google" {
  project = "rvgcp1000"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = file("../Credentials/sa_demo.json")
}

#Run the commands
terraform init
terraform fmt
terraform plan
```