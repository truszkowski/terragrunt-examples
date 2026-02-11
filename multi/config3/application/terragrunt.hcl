terraform {
	source = "./"
}

inputs = {
	ecs = dependency.ecs.outputs.ecs
}

dependency ecs {
	config_path = "../../config2/ecs"
	mock_outputs = {
		s3 = "mock-ecs"
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
		key                    = "fineshark/config3/application/terraform.tfstate"
		region                 = "eu-central-1"
		encrypt                = true
		dynamodb_table         = "spacelift-terragrunt-dynamodb"
		skip_bucket_versioning = true
	}
}
