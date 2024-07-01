module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = var.names.ec2
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = var.subnet_id
  iam_instance_profile   = aws_iam_instance_profile.iam_instance_profile.name

  tags = {
    Name = var.names.ec2
  }
}

resource "aws_security_group" "sg" {
  name        = "SG-tf"
  description = "Security Group for the EC2 instance"
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Name = var.names.sg
  }
  # ingress {
  #   description = "Allow HTTP"
  #   cidr_blocks = local.cidr_all
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  # }
  ingress {
    description = "Node App Port"
    cidr_blocks = local.cidr_all
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
  }
  egress {
    description = "Outbound Rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = local.cidr_all
  }
}

data "aws_vpc" "vpc" {
  id = "vpc-03d964f7cd3fa2c74"
}

data "aws_iam_policy" "ssm_ec2" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role" "iam" {
  name = "IAM-Sandesh"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ssm_role" {
  role       = aws_iam_role.iam.name
  policy_arn = data.aws_iam_policy.ssm_ec2.arn
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "Sandesh_Instance_Profile"
  role = aws_iam_role.iam.name
}
