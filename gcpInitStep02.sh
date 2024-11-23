#!/bin/bash

source ./gcpCommonVariables.sh

echo "Add domain to service"
gcloud beta run domain-mappings create \
  --service=$SERVICE_NAME \
  --domain=init.hinvento.v6hq.de \
  --region=$REGION 

echo .
echo "Step 02 complete."
