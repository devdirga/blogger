# require 'dcidev_mailer/mandrill'
#
# class MandrillMailer
#   class << self
#     def send_email(customer: nil, email_template: nil, attachments: nil, description: nil)
#       raise "invalid customer"if customer.nil?
#       raise "invalid template" if email_template.nil?
#       begin
#         response = ::DcidevMailer::Mandrill.send_email(
#           subject: email_template.subject,
#           html_body: MailerHelper.format_wording(email_template.wording, customer),
#           header_url: email_template.header.try(:url),
#           footer_url: email_template.footer.try(:url),
#           # to: customer.email / can also accept string
#           to: [{name: "Punto Damar P", type: "to", email: "dirgantoro.developer@gmail.com"}],
#           cc: nil, # can be a string / array
#           bcc: nil, # can be a string / array
#           from: ENV['DEFAULT_EMAIL_SENDER'],
#           from_name: ENV['DEFAULT_EMAIL_SENDER_NAME'],
#           attachments: attachments,
#           email_template_path: "subscriber/blast.html.erb"
#         # specify template file location
#         )
#       rescue => e
#         error_message = "[SEND EMAIL] " + e.try(:to_s)
#       ensure
#         EmailHistory.create(application: customer.application, template: email_template, status: response[0]["status"] == "sent" ? :sent : :failed, mail_provider_id: response[0]["_id"], form_cetak_attachment: attachments.present?, error_message: response[0]["reject_reason"]) if response.present?
#         ApplicationHistory.log(description: error_message || description, application: customer.application)
#       end
#     end
#
#     def sendmail
#       begin
#         response = ::DcidevMailer::Mandrill.send_email(
#           subject: "Test",
#           # to: customer.email / can also accept string
#           to: [{name: "Punto Damar P", type: "to", email: "dirgantoro.developer@gmail.com"}],
#           cc: nil, # can be a string / array
#           bcc: nil, # can be a string / array
#           from: ENV['DEFAULT_EMAIL_SENDER'],
#           from_name: ENV['DEFAULT_EMAIL_SENDER_NAME'],
#           email_template_path: "subscriber/blast.html.erb"
#         # specify template file location
#         )
#       rescue => e
#         error_message = "[SEND EMAIL] " + e.try(:to_s)
#       ensure
#         EmailHistory.create(application: "", template: "", status: response[0]["status"] == "sent" ? :sent : :failed, mail_provider_id: response[0]["_id"], form_cetak_attachment: attachments.present?, error_message: response[0]["reject_reason"]) if response.present?
#         ApplicationHistory.log(description: error_message || description, application: "")
#       end
#     end
#
#     public :test
#     def test
#       puts "print variable"
#     end
#   end
# end