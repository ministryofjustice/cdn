#!/usr/bin/env bash

set -euo pipefail

FRONTEND="${1}"
FRONTEND_VERSION="${2}"

# Check if FRONTEND is valid
case "${FRONTEND}" in
  "govuk-frontend")
    REPOSITORY="alphagov/govuk-frontend"
    RELEASE_PREFIX="release"
  ;;
  "moj-frontend")
    REPOSITORY="ministryofjustice/moj-frontend"
    RELEASE_PREFIX="release"
  ;;
  *)
    echo "Unknown frontend: ${FRONTEND}"
    echo "Valid options are: govuk-frontend, moj-frontend"
    exit 1
  ;;
esac

# Check if FRONTEND_VERSION is valid
if [[ "$(gh release list --repo "${REPOSITORY}" --exclude-pre-releases --json tagName | jq -r --arg tag "${FRONTEND_VERSION}" '.[].tagName | select(. == $tag)')" != "${FRONTEND_VERSION}" ]]; then
  echo "Invalid version: ${FRONTEND_VERSION}"
  echo "Please check available versions on GitHub: https://github.com/${REPOSITORY}/releases"
  exit 1
fi

# Create directories
mkdir --parents "dist/${FRONTEND}/${FRONTEND_VERSION}"
mkdir --parents "tmp/${FRONTEND}/${FRONTEND_VERSION}"

# Download artifact
gh release download \
  --repo "${REPOSITORY}" \
  --pattern "${RELEASE_PREFIX}-${FRONTEND_VERSION}.zip" \
  --dir "tmp/${FRONTEND}/${FRONTEND_VERSION}" \
  --clobber

# Unarchive artifact
unzip -o "tmp/${FRONTEND}/${FRONTEND_VERSION}/${RELEASE_PREFIX}-${FRONTEND_VERSION}.zip" -d "dist/${FRONTEND}/${FRONTEND_VERSION}"
