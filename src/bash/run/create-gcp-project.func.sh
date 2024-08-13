#!/bin/bash

do_create_gcp_project() {

  # TODO: Ensure the gcloud and gsutil are installed and in your PATH.
  do_log "INFO using the gcloud  version: "$(gcloud --version)
  quit_on "gcloud is not installed"

  do_require_var ORG $ORG
  do_require_var APP $APP
  do_require_var ENV $ENV
  PROJ_ID=${PROJ_ID:-$ORG-$APP-$ENV}
  do_require_var PROJ_ID ${PROJ_ID:-}
  PROJ_NAME=${PROJ_NAME:-$PROJ_ID}
  do_require_var GCP_BILLING_ACCOUNT_ID ${GCP_BILLING_ACCOUNT_ID:-}

  do_log "INFO Login and set project"
  gcloud auth login --update-adc
  quit_on "Login and set project failed"

  gcloud config set project ${PROJ_ID:-}

  do_log "INFO Create the GCP project"
  gcloud projects create ${PROJ_ID:-} --name="${PROJ_NAME}"
  quit_on "Create the GCP project "

  do_log "INFO link the billing account to the project"
  gcloud alpha billing projects link ${PROJ_ID:-} --billing-account=$GCP_BILLING_ACCOUNT_ID
  quit_on "Link the billing account to the project"

  do_log "INFO Set the project"
  gcloud config set project ${PROJ_ID:-}
  quit_on "Set the project"

  # for some reason this fails for tst and prd , but not dev ?!
  # do_log "INFO Set the quota project"
  # gcloud auth application-default set-quota-project ${PROJ_ID:-}
  # quit_on "Set the quota project"

  do_log "INFO enabling the Cloud Resource Manager required API"
  gcloud services enable cloudresourcemanager.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enabling the Cloud Resource Manager API"

  do_log "INFO enabling the Compute Engine API"
  gcloud services enable compute.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enabling the Compute Engine API"

  do_log "INFO enabling the Google sheets API"
  gcloud services enable sheets.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enabling the Google Sheets API"

  do_log "INFO enabling the Cloud DNS API"
  gcloud services enable dns.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enablnig the Cloud DNS API"

  do_log "INFO enabling the Service Management API"
  gcloud services enable servicemanagement.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enabling the Service Management API"

  do_log "INFO enabling Secret Manager API"
  gcloud services enable secretmanager.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enabling the Secret Manager API"

  do_log "INFO enabling the  IAM API"
  gcloud services enable iam.googleapis.com --project ${PROJ_ID:-}
  quit_on "Enabling the IAM API"

  do_log "INFO Creating the service account"
  export SERVICE_ACCOUNT="${PROJ_ID}"
  gcloud iam service-accounts create ${SERVICE_ACCOUNT} --display-name "${SERVICE_ACCOUNT}"
  quit_on "Creating the service account"

  do_log "INFO Assigning the roles to the service account (example: owner role)"
  gcloud projects add-iam-policy-binding ${PROJ_ID} --member "serviceAccount:${SERVICE_ACCOUNT}@${PROJ_ID}.iam.gserviceaccount.com" --role "roles/owner"
  quit_on "Assigning roles to the service account"

  do_log "INFO Create and download the service account key"
  mkdir -p ~/.gcp/.${ORG}
  gcloud iam service-accounts keys create ~/.gcp/.${ORG}/key-${SERVICE_ACCOUNT}.json --iam-account ${SERVICE_ACCOUNT}@${PROJ_ID}.iam.gserviceaccount.com
  quit_on "Creating and download the service account key"

  do_log "INFO Enabled APIs: Compute Engine, Google Sheets, Cloud DNS, Service Management, IAM"

  do_log "INFO Service account ${SERVICE_ACCOUNT} created and key saved to ~/.gcp/.${ORG}/key-${SERVICE_ACCOUNT}.json"
  do_log "INFO remember to add the service account key to the creds of the project"

  export EXIT_CODE="0"

}
