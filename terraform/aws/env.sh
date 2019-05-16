
export TF_VAR_aws_access_key=$(/r secret awsAccessKey)
export TF_VAR_aws_secret_key=$(/r secret awsSecretKey)
export TF_VAR_aws_region=$(/r secret awsRegion)
export TF_VAR_ssh_key_name=test1.pem