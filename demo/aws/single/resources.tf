# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A SINGLE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "web_server" {
  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type in us-east-2
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "<H1>Welcome to the Spirent Velocity / IaC Integration Demo!</H1>Running on a single node on AWS." > index.html
              nohup busybox httpd -f -p "${var.http_server_port}" &
              EOF

  tags = {
    Name = "trinity-web"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE SECURITY GROUP THAT'S APPLIED TO THE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allows HTTP inbound traffic from anywhere"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.http_server_port
    to_port     = var.http_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

