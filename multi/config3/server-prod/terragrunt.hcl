terraform {
	source = "./"
}

inputs = {
	application = dependency.application.outputs.application
}

dependency application {
	config_path = "../application"
	mock_outputs = {
		application = "mock-application"
	}
}

remote_state {
	backend = "s3"
	generate = {
		path      = "backend.tf"
		if_exists = "overwrite"
	}
	config = {
		bucket                 = "terragrunt-examples-tfstates"
		key                    = "fineshark/config3/server-prod/terraform.tfstate"
		region                 = "eu-central-1"
		encrypt                = true
		dynamodb_table         = "spacelift-terragrunt-dynamodb"
		skip_bucket_versioning = true
	}
}
