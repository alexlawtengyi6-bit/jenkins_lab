resource "local_file" "staging_env" {
  filename = "${path.module}/staging_status.txt"
  content  = "ENVIRONMENT: STAGING\nSTATUS: ACTIVE\nUpdated: 2026-v1"
}