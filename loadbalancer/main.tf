resource "aws_lb" "vault_lb" {
  name               = "vault-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.private_sg_id]
  subnets            = [var.public_subnet_id, var.private_subnet_id]

  tags = {
    Name = "vault-lb"
  }
}

resource "aws_lb_target_group" "vault_tg" {
  name     = "vault-target-group"
  port     = 8200
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    port                = 8200
    protocol            = "HTTP"
    path                = "/v1/sys/health?uninitcode=200"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "vault" {
  target_group_arn = aws_lb_target_group.vault_tg.arn
  target_id        = var.consul_instance_id
  
  port             = 8200
}

resource "aws_lb_listener" "vault" {
  load_balancer_arn = aws_lb.vault_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vault_tg.arn
  }
}
