resource "random_pet" "pet" {
  length = 2
}

variable "a_random_pet" {
  type = string
}

variable "a_sensitive_output" {
  type      = string
  sensitive = true
}

variable "a_var_pet" {
  type = string
}

output "random_pet" {
  value = random_pet.pet.id
}

output "a_var_pet" {
  value = var.a_var_pet
}

output "a_random_pet" {
  value = var.a_random_pet
}

output "a_sensitive_output" {
  value     = var.a_sensitive_output
  sensitive = true
}

