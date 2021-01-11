#! bin/bash

gcloud container clusters update gke-e2e-demo --enable-master-authorized-networks --master-authorized-networks 192.2.3.4/32 --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com

gcloud container clusters describe gke-e2e-demo --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com



