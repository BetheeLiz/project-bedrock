# DB Subnet Group
resource "aws_db_subnet_group" "project_bedrock_db_subnet_group" {
  name = "project-bedrock-db-subnet-group"

  subnet_ids = aws_subnet.private_subnets[*].id

  tags = {
    Name    = "project-bedrock-db-subnet-group"
    Project = "karatu-2025-capstone"
  }
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "project-bedrock-rds-sg"
  description = "Allow database access from EKS nodes"
  vpc_id      = aws_vpc.project_bedrock_vpc.id

  ingress {
    description = "MySQL from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.project_bedrock_vpc.cidr_block]
  }

  ingress {
    description = "PostgreSQL from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.project_bedrock_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "project-bedrock-rds-sg"
    Project = "karatu-2025-capstone"
  }
}

# MySQL RDS
resource "aws_db_instance" "mysql_db" {
  identifier = "project-bedrock-mysql"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "retailstore"
  username = var.db_username
  password = var.db_password

  publicly_accessible = false
  multi_az            = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  db_subnet_group_name = aws_db_subnet_group.project_bedrock_db_subnet_group.name

  tags = {
    Name    = "project-bedrock-mysql"
    Project = "karatu-2025-capstone"
  }
}

# PostgreSQL RDS
resource "aws_db_instance" "postgres_db" {
  identifier = "project-bedrock-postgres"

  engine         = "postgres"
  engine_version = "17.4"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "retailstore"
  username = var.db_username
  password = var.db_password

  publicly_accessible = false
  multi_az            = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  db_subnet_group_name = aws_db_subnet_group.project_bedrock_db_subnet_group.name

  tags = {
    Name    = "project-bedrock-postgres"
    Project = "karatu-2025-capstone"
  }
}