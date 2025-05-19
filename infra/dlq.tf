resource "aws_sqs_queue" "created_customer_dead_letter_queue" {
  name = "created-customer-dlq"
  max_message_size = 262144
  message_retention_seconds = 86400

  tags = {
    Name = "created-customer-dlq"
  }
}

resource "aws_sqs_queue" "created_order_dead_letter_queue" {
  name = "created-order-dlq"
  max_message_size = 262144
  message_retention_seconds = 86400

  tags = {
    Name = "created-order-dlq"
  }
}

resource "aws_sqs_queue" "processed_payment_dead_letter_queue" {
  name = "processed-payment-dlq"
  max_message_size = 262144
  message_retention_seconds = 86400

  tags = {
    Name = "processed-payment-dlq"
  }
}