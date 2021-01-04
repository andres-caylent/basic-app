#! bin/bash

echo "This is the external IP for this worker"
curl http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google"

echo "This is the default service account for this worker"
curl http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/ -H "Metadata-Flavor: Google"
