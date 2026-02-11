resource random_pet pet {}

variable "s3" {
    type = string
}

variable "sqs" {
    type = string
}

output "ecs" {
  value = random_pet.pet.id
}

output "s3" {
  value = var.s3
}

output "sqs" {
  value = var.sqs
}

