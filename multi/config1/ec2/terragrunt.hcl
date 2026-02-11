terraform {
	source = "./"
}

inputs = {
	r53 = dependency.r53.outputs.r53
	s3 = dependency.s3.outputs.s3
	sqs = dependency.sqs.outputs.sqs
}

dependency r53 {
	config_path = "../r53"
	mock_outputs = {
		r53 = "mock-r53"
	}
}

dependency s3 {
	config_path = "../s3"
	mock_outputs = {
		s3 = "mock-s3"
	}
}

dependency sqs {
	config_path = "../sqs"
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
		key                    = "fineshark/config1/ec2/terraform.tfstate"
		region                 = "eu-central-1"
		encrypt                = true
		dynamodb_table         = "spacelift-terragrunt-dynamodb"
		skip_bucket_versioning = true
	}
}
