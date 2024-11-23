#!/bin/bash

source ./gcpCommonVariables.sh

echo "Create GCP project"
gcloud projects create $PROJECT_ID --name="Hinvento"
gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT_ID
gcloud config set project $PROJECT_ID

echo "Enable required APIs"
gcloud services enable run.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com

echo "Create Service Account"
gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME \
    --description="Service Account for Cloud Run Deployment" \
    --display-name="Cloud Run Deployer"

echo "Assign roles to Service Account"
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/run.admin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/storage.admin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.admin"
    
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"

echo "Generate Service Account key"
gcloud iam service-accounts keys create ./gcp-key.json \
    --iam-account="$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com"

echo "Generate Docker repository"
gcloud artifacts repositories create $REPO_NAME \
    --repository-format=docker \
    --location=$REGION \
    --description="Docker repository for Cloud Run deployment"

echo "Deploy example service"
# service will be updated with correct image later
# service is only created to be able to add domain mapping
gcloud run deploy $SERVICE_NAME \
    --image us-docker.pkg.dev/cloudrun/container/hello\
    --platform managed \
    --region $REGION \
    --allow-unauthenticated

echo .
echo "Step 01 complete."
echo "The service account key is saved as gcp-key.json."
echo "Now verify your domain before going on. See https://cloud.google.com/run/docs/mapping-custom-domains/#run".