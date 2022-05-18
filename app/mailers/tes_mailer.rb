require 'dcidev_mailer/mandrill'

class TesMailer
  class << self
    def send_email_subscriber(subscriber, author, article)
      begin
        puts article.title
        response = ::DcidevMailer::Mandrill.send_email(
          subject: "Hello, #{subscriber.name}",
          html_body: "<h2>Hai, #{subscriber.name}.</h2></br><h4>#{author.name} baru saja membuat artikel baru</h4>",
          to: [{name: "#{subscriber.name}", type: "to", email: subscriber.email}],
          from: ENV['DEFAULT_EMAIL_SENDER'],
          from_name: ENV['DEFAULT_EMAIL_SENDER_NAME'],
          email_template_path: "subscriber_mailer/subscriber_email"
        )
        p response
      rescue => e
        error_message = "[SEND EMAIL] " + e.try(:to_s)
        puts error_message
      ensure
      end
    end
  end
end