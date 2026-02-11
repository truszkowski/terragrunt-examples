terraform {
	source = "./"
}

inputs = {
	a_var_pet = dependency.a.outputs.var_pet
	a_random_pet = dependency.a.outputs.random_pet
	a_sensitive_output = dependency.a.outputs.sensitive_output
}

dependency a {
	config_path = "../proj-a"
	mock_outputs = {
		var_pet = "var-pet-a"
		random_pet = "random-pet-a"
		sensitive_output = "mock-sensitive-value"
	}
}


