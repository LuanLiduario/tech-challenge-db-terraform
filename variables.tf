variable "vpc_name" {
  default = "main-vpc"
  description = "Nome da VPC onde o banco será provisionado"
  type        = string
}

variable "db_name" {
  default     = "fastfood"
  description = "Nome do banco de dados"
}

variable "db_user" {
  description = "Usuário master do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}
