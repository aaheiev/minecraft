#!/usr/bin/env bash

gcloud projects add-iam-policy-binding <project_id> \
--member='serviceAccount:test-wif@<project_id>.iam.gserviceaccount.com' \
--role="roles/compute.viewer"gcloud iam service-accounts add-iam-policy-binding test-wif@<project_id>.iam.gserviceaccount.com \
--project=<project_id> \
--role="roles/iam.workloadIdentityUser" \
--member="principalSet://iam.googleapis.com/projects/<project_number>/locations/global/workloadIdentityPools/github-wif-pool/attribute.repository/PradeepSingh1988/gcp-wif"

gcloud iam workload-identity-pools providers create-oidc github-oidc \
  --location="global" \
  --workload-identity-pool="github-pool"  \
  --issuer-uri="https://token.actions.githubusercontent.com" \
  --attribute-mapping="attribute.actor=assertion.actor,google.subject=assertion.sub,attribute.repository=assertion.repository" \
  --project aaheiev-335511
