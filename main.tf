module "producer" {
  source = "./producer"
}

locals {
# BAD
#  module_call_as_object = module.producer
# GOOD
  module_call_as_object = module.producer.id
}

resource "random_pet" "main" {
  prefix = local.module_call_as_object
}

locals {
  know_value = replace("mystring", "string", random_pet.main.id)
}

# know value
output "know_value" {
  value = local.know_value
}

#unknown value

resource "random_integer" "this" {
 max  =  100
 min = 0 
}

output "unknown_value" {
  value = random_integer.this.id
}