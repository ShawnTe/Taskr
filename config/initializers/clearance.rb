Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "hiya@remember2due.com"
  config.rotate_csrf_on_sign_in = true
end
