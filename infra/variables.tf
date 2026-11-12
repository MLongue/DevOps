variable "aws_region" {
  description = "Região da AWS para menor latência com o RS (São Paulo)"
  type        = string
  default     = "sa-east-1"
}

variable "project_name" {
  description = "Prefixo do projeto alinhado à iniciativa de São Leopoldo/RS"
  type        = string
  default     = "taskflow-saoleopoldo-devops"
}

variable "instance_type" {
  description = "Tipo da instância EC2 otimizada"
  type        = string
  default     = "t3.micro"
}
