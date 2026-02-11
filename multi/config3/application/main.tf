resource random_pet pet {}

variable "ecs" {
    type = string
}

output "application" {
  value = random_pet.pet.id
}

output "ecs" {
  value = var.ecs
}
