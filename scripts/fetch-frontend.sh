#!/usr/bin/env bash

set -euo pipefail

FRONTEND="${1}"
FRONTEND_VERSION="${2}"

# Check if FRONTEND is valid
case "${FRONTEND}" in
  "govuk")
    REPOSITORY="alphagov/govuk-frontend"
  ;;
  "moj")
    REPOSITORY="ministryofjustice/moj-frontend"
  ;;
  *)
    echo "Unknown frontend: ${FRONTEND}"
    echo "Valid options are: govuk, moj"
    exit 1
  ;;
esac

# Check if FRONTEND_VERSION is valid




#######################

# mkdir --parents "dist/${FRONTEND}/${FRONTEND_VERSION}"
# mkdir --parents "tmp/${FRONTEND}/${FRONTEND_VERSION}"

# # https://github.com/alphagov/govuk-frontend/releases/download/v5.10.0/release-v5.10.0.zip
# # https://github.com/ministryofjustice/moj-frontend/releases/download/v5.1.3/release-v5.1.3.zip

# curl --location "https://github.com/ministryofjustice/moj-frontend/releases/download/v5.1.3/release-v5.1.3.zip" \
#   --output "tmp/${FRONTEND}/${FRONTEND_VERSION}/release.zip"
