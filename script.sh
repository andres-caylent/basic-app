#! bin/bash

#echo "This is the external IP for this worker"
#curl http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google"


#echo "This is the private IP for this worker"
#curl http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip -H "Metadata-Flavor: Google"

echo "Result from ifconfig.io"
PUBLIC_IP=$(curl ifconfig.io)
echo $PUBLIC_IP > /workspace/IP.txt

echo "This is the default service account for this worker"
curl http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/ -H "Metadata-Flavor: Google"

#gcloud container clusters describe gke-e2e-demo --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com


#gcloud container clusters update gke-e2e-demo --enable-master-authorized-networks --master-authorized-networks $PUBLIC_IP/32 --region us-west1-a --impersonate-service-account=gke-custom@andres-testing.iam.gserviceaccount.com