resource random_pet pet {}

variable "application" {
    type = string
}

output "server" {
  value = random_pet.pet.id
}

output "application" {
  value = var.application
}

