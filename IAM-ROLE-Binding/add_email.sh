#!/bin/bash

# Path to your JSON file
json_file="terraform.tfvars.json"

# Comma-separated emails to check/add
email_to_check=$1

# Convert the comma-separated emails to an array
IFS=',' read -ra emails <<< "$email_to_check"

# Loop through the array of emails
for email in "${emails[@]}"; do
  # Check if the email is already in the JSON array
  if jq -e --arg email "$email" '.emails | index($email)' "$json_file" >/dev/null; then
      echo "Email '$email' already exists in the JSON array."
  else
      # Add the new email to the JSON array
      jq --arg email "$email" '.emails += [$email]' "$json_file" > temp.json && mv temp.json "$json_file"
      echo "Added email '$email' to the JSON array."
  fi
done
