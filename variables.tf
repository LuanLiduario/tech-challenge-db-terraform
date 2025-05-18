variable "db_user" {
  description = "Usuário do banco de dados"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  default     = "mysecretpassword"
}

variable "db_name" {
  description = "Nome do banco de dados inicial"
  type        = string
  default     = "fastfood"
}
