resource "random_password" "password" {
  length = 16
}

output "paswword" {
  value = random_password.password.result
}
