resource "aws_sqs_queue" "created_customer_queue" {
  name = "created-customer-queue"
  delay_seconds = 0
  max_message_size = 262144
  message_retention_seconds = 86400
  receive_wait_time_seconds = 0
  visibility_timeout_seconds = 30

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.created_customer_dead_letter_queue.arn
    maxReceiveCount     = 5
  })
  tags = {
    Name = "created-customer-queue"
  }
  depends_on = [aws_sqs_queue.created_customer_dead_letter_queue]
}

resource "aws_sqs_queue" "created_order_queue" {
  name = "created-order-queue"
  delay_seconds = 0
  max_message_size = 262144
  message_retention_seconds = 86400
  receive_wait_time_seconds = 0
  visibility_timeout_seconds = 30

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.created_order_dead_letter_queue.arn
    maxReceiveCount     = 5
  })
  tags = {
    Name = "created-order-queue"
  }
  depends_on = [aws_sqs_queue.created_order_dead_letter_queue]
}

resource "aws_sqs_queue" "processed_payment_queue" {
  name = "processed-payment-queue"
  delay_seconds = 0
  max_message_size = 262144
  message_retention_seconds = 86400
  receive_wait_time_seconds = 0
  visibility_timeout_seconds = 30

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.processed_payment_dead_letter_queue.arn
    maxReceiveCount     = 5
  })
  tags = {
    Name = "processed-payment-queue"
  }
  depends_on = [aws_sqs_queue.processed_payment_dead_letter_queue]
}