provider "aws" {
    region = "us-east-1"
}
resource "aws_db_instance" "test" {
  identifier            = "example-db"
  engine                = "mysql"
  instance_class        = "db.t2.micro"
  allocated_storage     = 10
  storage_type          = "gp2"
  username              = "admin"
  password              = "password123"
  auto_minor_version_upgrade = false
  skip_final_snapshot = true
}
