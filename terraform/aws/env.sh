
export TF_VAR_aws_access_key=$(/r secret aws/awsAccessKey)
export TF_VAR_aws_secret_key=$(/r secret aws/awsSecretKey)
export TF_VAR_aws_region=$(/r secret aws/awsRegion)
export TF_VAR_ssh_key_name=test1.pem