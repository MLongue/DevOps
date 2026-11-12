output "instance_id" {
  description = "ID da máquina criada na AWS"
  value       = aws_instance.app_server.id
}

output "public_ip" {
  description = "IP público para acessar o servidor"
  value       = aws_instance.app_server.public_ip
}

output "api_endpoint" {
  description = "Endereço pronto para testar o healthcheck da API"
  value       = "http://${aws_instance.app_server.public_ip}:8000/health"
}
