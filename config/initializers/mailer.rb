# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.add_delivery_method :mandrill_mailer, MandrillMailer
# smtp_settings = {
#   address: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_ADDRESS'] : ENV["MAILER_SMTP_ADDRESS"],
#   domain: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_DOMAIN'] : ENV["MAILER_SMTP_DOMAIN"],
#   enable_starttls_auto: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? true : false,
#   tls: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? true : false,
#   port: ENV["USE_MANDRILL_MAILER"].to_i == 1 ? ENV['MANDRILL_SMTP_PORT'] : ENV["MAILER_SMTP_PORT"],
# }
# if ENV["USE_MANDRILL_MAILER"].to_i == 1
#   smtp_settings[:authentication] = 'plain'
#   smtp_settings[:password] = ENV['MANDRILL_SMTP_PASSWORD']
#   smtp_settings[:user_name] = ENV['MANDRILL_SMTP_USERNAME']
# end
# ActionMailer::Base.smtp_settings = smtp_settings
# ActionMailer::Base.default_url_options = {
#   host: ENV["BASE_URL_FE"]
# }
# ActionMailer::Base.register_preview_interceptor(ActionMailer::InlinePreviewInterceptor)
# ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.perform_caching = false
# MandrillMailer.configure do |config|
#   config.api_key = ENV["MANDRILL_SMTP_PASSWORD"]
#   config.deliver_later_queue_name :default
# end
#
# from https://github.com/renz45/mandrill_mailer