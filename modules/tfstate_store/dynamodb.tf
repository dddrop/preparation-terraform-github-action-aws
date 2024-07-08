resource "aws_dynamodb_table" "default" {
  name         = "${var.project}-terraform-state-table-${var.random_key}"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}