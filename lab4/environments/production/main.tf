resource "local_file" "production_env" {
  filename = "${path.module}/production_status.txt"
  content  = "ENVIRONMENT: PRODUCTION\nSTATUS: ACTIVE\nCRITICAL: Enterprise Protected Live Environment"
}