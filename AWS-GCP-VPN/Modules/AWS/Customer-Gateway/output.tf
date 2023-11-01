output "customer_gateway_ids" {
  value = [aws_customer_gateway.customer_gateway_01.id, aws_customer_gateway.customer_gateway_02.id]
}
