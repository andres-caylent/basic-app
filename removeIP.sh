#! bin/bash



FROMERWHITELIST=$(cat /workspace/FORMERWHITELIST.json)

## Updating the whitelist
gcloud container clusters update gke-e2e-demo --enable-master-authorized-networks --master-authorized-networks $FROMERWHITELIST --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com

## Just reviewing cluster settings.
gcloud container clusters describe gke-e2e-demo --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com



