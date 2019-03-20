
variable "className" {
  type = "string"
  default ="vault-101"
}

variable "students" {
  type    = "list"
  default =  [ "roger", "tyler", "gonzolo", "john" ]

}

variable "enrollment" {
 default="4"
}
