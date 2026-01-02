variable "sql_database" {
  type = map(object({
      name         = string
  collation    = string
  license_type = string
  }))
}