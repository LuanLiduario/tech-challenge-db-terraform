output "db_instance_identifier" {
  description = "Identificador da instância RDS"
  value       = aws_db_instance.fastfood_db.id
}

output "db_endpoint" {
  description = "Endpoint do banco de dados para conexão"
  value       = aws_db_instance.fastfood_db.endpoint
}

output "db_port" {
  description = "Porta de conexão"
  value       = aws_db_instance.fastfood_db.port
}

output "db_name" {
  description = "Nome do banco de dados"
  value       = aws_db_instance.fastfood_db.db_name
}

output "db_username" {
  description = "Usuário padrão do banco de dados"
  value       = aws_db_instance.fastfood_db.username
  sensitive   = true
}
