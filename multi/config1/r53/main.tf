resource random_pet pet {}

output "r53" {
  value = random_pet.pet.id
}
