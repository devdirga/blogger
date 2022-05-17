class SubscriberMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def welcome_email(subscriber, title)
    file = File.join(Rails.root, title)
    attachments[title] = File.read(file)
    mail(to: subscriber.email, subject: "Hello #{subscriber.name}")
  end
  def mail_to_subscriber(subscriber, author, article)
    title = article.title + ".pdf"
    file = File.join(Rails.root, title)
    attachments[title] = File.read(file)
    mail(to: subscriber.email, subject: "Hello #{subscriber.name}") do |format|
      format.html { render html: "<h2>Hai, #{subscriber.name}.</h2></br><h4>#{author.name} baru saja membuat artikel baru</h4>".html_safe }
    end
  end
end
