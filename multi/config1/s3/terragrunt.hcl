terraform {
	source = "./"
}

remote_state {
	backend = "s3"
	generate = {
		path      = "backend.tf"
		if_exists = "overwrite"
	}
	config = {
		bucket                 = "terragrunt-examples-tfstates"
		key                    = "fineshark/config1/s3/terraform.tfstate"
		region                 = "eu-central-1"
		encrypt                = true
		dynamodb_table         = "spacelift-terragrunt-dynamodb"
		skip_bucket_versioning = true
	}
}
