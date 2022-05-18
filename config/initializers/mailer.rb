ActionMailer::Base.delivery_method = :smtp

# change it to your helper class name
ActionMailer::Base.add_delivery_method :mandrill_mailer, MandrillMailer

# uncomment if neccessary
smtp_settings = {
  address: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_ADDRESS'] : ENV["MAILER_SMTP_ADDRESS"],
  # authentication: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? 'plain' : nil,
  domain: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_DOMAIN'] : ENV["MAILER_SMTP_DOMAIN"],
  enable_starttls_auto: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? true : false,
  tls: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? true : false,
  # password: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_PASSWORD'] : ENV["MAILER_SMTP_PASSWORD"],
  port: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_PORT'] : ENV["MAILER_SMTP_PORT"],
  # user_name: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_USERNAME'] : ENV["MAILER_SMTP_USERNAME"],
  # openssl_verify_mode: "none",
}

if ENV["USE_MANDRILL_MAILER"].to_i == 1
  smtp_settings[:authentication] = 'plain'
  smtp_settings[:password] = ENV['MANDRILL_SMTP_PASSWORD']
  smtp_settings[:user_name] = ENV['MANDRILL_SMTP_USERNAME']
end

ActionMailer::Base.smtp_settings = smtp_settings

ActionMailer::Base.default_url_options = {
  host: ENV["BASE_URL_FE"]
}
ActionMailer::Base.register_preview_interceptor(ActionMailer::InlinePreviewInterceptor)

# Don 't care if the mailer can't send.
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.perform_caching = false

MandrillMailer.configure do |config|
  config.api_key = ENV["MANDRILL_SMTP_PASSWORD"]
  config.deliver_later_queue_name :default
end