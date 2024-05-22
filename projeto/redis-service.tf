resource "aws_ecs_task_definition" "redis" {
  family                   = "redis"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  container_definitions = jsonencode([
    {
      name      = "redis"
      image     = "redis"
      essential = true
#      entryPoint = [
#        "sh",
#        "-c"
#      ]
#      command = [
#        "redis-cli "
#      ]
      portMappings = [
        {
          containerPort = 6379
          hostPort      = 6379
        }
      ]
    }
  ])

#  volume {
#    name      = "service-storage"
#    host_path = "/ecs/service-storage"
#  }
}

resource "aws_ecs_service" "redis_service" {
  name            = "${var.project_name}-redis-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.redis.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "redis"
    container_port   = 6379
  }
  network_configuration {
    subnets          = [for subnet in aws_subnet.ecs_subnet : subnet.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
  depends_on = [
    aws_lb_listener.front_end
  ]
}