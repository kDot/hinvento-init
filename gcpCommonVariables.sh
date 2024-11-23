#!/bin/bash

# Variables
PROJECT_ID="hinvento-002"
BILLING_ACCOUNT_ID="" # eg. 123456-123456-123456
SERVICE_ACCOUNT_NAME="cloud-run-deployer"
REGION="europe-west4" #as of 20241123 west4 support easy domain assignment to cloud run. See https://cloud.google.com/run/docs/mapping-custom-domains/#run
REPO_NAME="docker-repo"
SERVICE_NAME="hinvento-init"

if [ -z "${!BILLING_ACCOUNT_ID}" ]; then
    echo "The variable 'BILLING_ACCOUNT_ID' is empty. Please enter a value:"
    read -r user_input

    # Update the value of the variable
    eval "BILLING_ACCOUNT_ID='$user_input'"
fi
