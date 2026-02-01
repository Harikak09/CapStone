resource "aws_cloudwatch_metric_alarm" "cpu_high" {

  alarm_name          = "project3-HighCPUAlarm"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods  = 1

  metric_name         = "CPUUtilization"

  namespace           = "AWS/EC2"

  period              = 60

  statistic           = "Average"

  threshold           = 50

  alarm_description   = "Alarm when CPU exceeds 50%"

  

  dimensions = {

    InstanceId = aws_instance.project3-cpu-test.id

  }



  alarm_actions = [] 

}


