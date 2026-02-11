resource "random_pet" "pet" {
  length = 1
}

variable "pet" {
  type = string
}

output "random_pet" {
  value = random_pet.pet.id
}

output "var_pet" {
  value = var.pet
}

output "sensitive_output" {
  value     = "sensitive_value"
  sensitive = true
}

