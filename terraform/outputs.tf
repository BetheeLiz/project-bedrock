output "cluster_name" {
  value = aws_eks_cluster.project_bedrock_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.project_bedrock_cluster.endpoint
}

output "region" {
  value = var.aws_region
}

output "vpc_id" {
  value = aws_vpc.project_bedrock_vpc.id
}
output "mysql_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}

output "postgres_endpoint" {
  value = aws_db_instance.postgres_db.endpoint
}