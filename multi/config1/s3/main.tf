resource random_pet pet {}

output "s3" {
  value = random_pet.pet.id
}
