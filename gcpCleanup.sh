#!/bin/bash

source ./gcpCommonVariables.sh

echo "Remove GCP project"
gcloud projects delete $PROJECT_ID