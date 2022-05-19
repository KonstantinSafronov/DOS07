resource "aws_lb" "hw_module" {
  name               = "hw37-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sgr_id
  subnets            = var.pub_net

#  enable_deletion_protection = true

#  access_logs {
#    bucket  = var.s3_backet
#    prefix  = "hw37-lb"
#    enabled = true
#  }

  tags = {
    Environment = "hw37"
  }
}
