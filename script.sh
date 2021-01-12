#! bin/bash

## Reading external IP from instance metadata. 
#curl http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google"

## Reading extenal IP from 
echo "Result from ifconfig.io"
PUBLIC_IP=$(curl ifconfig.io)
echo $PUBLIC_IP

## Sending the IP to file to be able to read it from another builder.
echo $PUBLIC_IP > /workspace/IP.json

## Getting the former whitelist from cluster.
FORMERWHITELIST=$(gcloud container clusters describe gke-e2e-demo --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com --format json | jq -r '.masterAuthorizedNetworksConfig.cidrBlocks[].cidrBlock')
echo $FORMERWHITELIST > /workspace/FORMERWHITELIST.json

gcloud container clusters update gke-e2e-demo --enable-master-authorized-networks --master-authorized-networks $PUBLIC_IP/32 --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com

