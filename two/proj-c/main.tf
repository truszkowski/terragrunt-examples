resource "random_password" "example" {
  length  = 16
  special = true
}

output "generated_password" {
  value = nonsensitive(random_password.example.result)
}
