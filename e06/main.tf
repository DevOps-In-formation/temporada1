resource "random_password" "password" {
  lenght = 16
}

output "paswword" {
  value = random_password.password.result
}
