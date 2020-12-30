#! bin/bash

echo "This is the external IP for this worker"
curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip

echo "This is the default service account for this worker"
curl http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/ -H "Metadata-Flavor: Google"
