#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID=$(/r secret azure/armSubscriptionId)
export ARM_CLIENT_ID=$(/r secret azure/armClientId)
export ARM_CLIENT_SECRET=$(/r secret azure/armClientPassword)
export ARM_TENANT_ID=$(/r secret azure/armTenantId)

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public

export TF_VAR_ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
export TF_VAR_ARM_CLIENT_ID=$ARM_CLIENT_ID
export TF_VAR_ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET
export TF_VAR_ARM_TENANT_ID=$ARM_TENANT_ID
export TF_VAR_ARM_ENVIRONMENT=$ARM_ENVIRONMENT

export TF_VAR_ssh_key_name=test1.pem