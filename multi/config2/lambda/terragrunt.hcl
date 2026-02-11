terraform {
	source = "./"
}

inputs = {
	s3 = dependency.s3.outputs.s3
	sqs = dependency.sqs.outputs.sqs
}

dependency s3 {
	config_path = "../../config1/s3"
	mock_outputs = {
		s3 = "mock-s3"
	}
}

dependency sqs {
	config_path = "../../config1/sqs"
	mock_outputs = {
		sqs = "mock-sqs"
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
		key                    = "fineshark/config2/lambda/terraform.tfstate"
		region                 = "eu-central-1"
		encrypt                = true
		dynamodb_table         = "spacelift-terragrunt-dynamodb"
		skip_bucket_versioning = true
	}
}
