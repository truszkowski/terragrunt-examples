resource random_pet pet {}

output "sqs" {
  value = random_pet.pet.id
}
