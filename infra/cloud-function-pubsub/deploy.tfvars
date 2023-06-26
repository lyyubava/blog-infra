location             = "europe-central2"
name                 = "notify"
entry_point          = "SendNotification"
path_to_code_archive = "/tmp/notification.zip"
topic_name           = "notification"
runtime              = "go120"
project_id           = "corded-key-385010"
environment_variables = {
  MAIL_FROM     = "testblogapi1@gmail.com"
  MAIL_PASSWORD = "d d o f n u e v s i g h y e w f"
  SMTP_URI      = "smtp.gmail.com:587"
  SMTP_HOST     = "smtp.gmail.com"
}
