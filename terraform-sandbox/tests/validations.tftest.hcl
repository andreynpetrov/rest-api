run "random_pet_default" {

  command = apply

  assert {
    condition     = length(random_pet.this[*].id) == 0
    error_message = "random_pet is not disabled by default."
  }

}

run "random_pet_enabled" {

  command = apply

  variables {
    enabled     = true
    separator   = "/"
    environment = "stg"
    cluster     = "green"
  }

  assert {
    condition     = startswith(random_pet.this[0].id, join(var.separator, [var.environment, data.aws_region.this.name, var.cluster])) == true
    error_message = "Bad prefix for random_pet."
  }

  assert {
    condition     = length(random_pet.this[*].id) == 1
    error_message = "Wrong count of random_pet"
  }

}
