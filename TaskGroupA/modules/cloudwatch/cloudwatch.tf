# CloudWatch Alarm for high CPU utilization on both EC2 instances
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  count               = length(var.instance_ids)
  alarm_name          = "High-CPU-Utilization-Instance-${var.instance_ids[count.index]}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300  # 5 minutes
  statistic           = "Average"
  threshold           = 50   # Trigger alarm if CPU utilization > 50%

  # Monitoring specific EC2 instance
  dimensions = {
    InstanceId = var.instance_ids[count.index]
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn  # SNS Topic ARN for notifications
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]

  insufficient_data_actions = [
    aws_sns_topic.alerts.arn
  ]

  unit = "Percent"
}

# SNS Topic for alert notifications
resource "aws_sns_topic" "alerts" {
  name = "alerts-topic"
}

# add email to SNS Topic
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.email
}
