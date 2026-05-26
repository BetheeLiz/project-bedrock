resource "aws_dynamodb_table" "orders_table" {
  name         = "project-bedrock-orders"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "order_id"

  attribute {
    name = "order_id"
    type = "S"
  }

  tags = {
    Name = "project-bedrock-orders"
  }
}