resource random_pet pet {}

variable r53 {
    type = string
}

variable sqs {
    type = string
}

variable s3 {
    type = string
}

output "ec2" {
  value = random_pet.pet.id
}

output "r53" {
  value = var.r53
}

output "sqs" {
  value = var.sqs
}

output "s3" {
  value = var.s3
}
