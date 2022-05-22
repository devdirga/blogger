require 'rufus-scheduler'

if defined?(Rails::Console)|| Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'
  return
end

scheduler = Rufus::Scheduler.new
scheduler.every '30s' do
  t = Time.zone.now
  hrs = t.strftime("%I:%M")
  days = t.strftime("%A")
  puts "clock : #{hrs}"
  Scheduler.where("clock='#{hrs}' AND #{days}=TRUE").each do |sch|
    Article.where(blast:false).each do |article|
      author = Author.find_by_email(article.author)
      Subscription.where(author_id:author.id).each do |subscription|
        subscriber = Subscriber.find(subscription.subscriber_id)
        ::TesMailer.delay(:queue => "#{subscriber.email} - #{author.name} - #{article.title}").send_email_subscriber(subscriber, author, article)
      end
      article.update(blast:true)
    end
  end
end