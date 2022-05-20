require 'rufus-scheduler'

if defined?(Rails::Console)|| Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'
  return
end

scheduler = Rufus::Scheduler.new
scheduler.every '1m' do
  t = Time.zone.now
  hrs = t.strftime("%I:%M")
  days = t.strftime("%A")

  Scheduler.where(clock:hrs).each do |sch|
    tmp = []
    if(sch.sun)
      tmp.push("Sunday")
    end
    if(sch.mon)
      tmp.push("Monday")
    end
    if(sch.tue)
      tmp.push("Tuesday")
    end
    if(sch.wed)
      tmp.push("Wednesday")
    end
    if(sch.thu)
      tmp.push("Thursday")
    end
    if(sch.fri)
      tmp.push("Friday")
    end
    if(sch.sat)
      tmp.push("Saturday")
    end
    if (tmp.include?days)
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
end