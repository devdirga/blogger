require 'rufus-scheduler'

if defined?(Rails::Console)|| Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'
  return
end

scheduler = Rufus::Scheduler.new
scheduler.every '1m' do
  t = Time.zone.now
  hrs = t.strftime("%I:%M")
  days = t.strftime("%A")
  tsun = false
  tmon = false
  ttue = false
  twed = false
  tthu = false
  tfri = false
  tsat = false
  case days
  when "Sunday"
    tsun = true
  when "Monday"
    tmon = true
  when "Tuesday"
    ttue = true
  when "Wednesday"
    twed = true
  when "Thursday"
    tthu = true
  when "Friday"
    tfri = true
  when "Saturday"
    tsat = true
  end

  puts hrs

  Scheduler.where(clock:hrs,sun:tsun,mon:tmon,tue:ttue,wed:twed,thu:tthu,fri:tfri,sat:tsat).each do
    Article.where(blast:false).each do |article|
      author = Author.find_by_email(article.author)
      Subscription.where(author_id:author.id).each do |subscription|
        subscriber = Subscriber.find(subscription.subscriber_id)
        ::TesMailer.send_email_subscriber(subscriber, author, article)
      end
    end
  end

end