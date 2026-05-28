resource "aws_eks_cluster" "project_bedrock_cluster" {
  name     = "project-bedrock-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.33"

  vpc_config {
    subnet_ids = concat(
      aws_subnet.public_subnets[*].id,
      aws_subnet.private_subnets[*].id
    )
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    Name    = "project-bedrock-cluster"
    Project = "karatu-2025-capstone"
  }
}

resource "aws_eks_node_group" "project_bedrock_nodes" {
  cluster_name    = aws_eks_cluster.project_bedrock_cluster.name
  node_group_name = "project-bedrock-node-group"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn

  subnet_ids = aws_subnet.private_subnets[*].id

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.small"]

  capacity_type = "ON_DEMAND"

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_policy
  ]

  tags = {
    Name    = "project-bedrock-node-group"
    Project = "karatu-2025-capstone"
  }
}