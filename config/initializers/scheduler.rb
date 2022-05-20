require 'rufus-scheduler'

if defined?(Rails::Console)|| Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'
  return
end

scheduler = Rufus::Scheduler.new
scheduler.every '20s' do
  t = Time.zone.now
  hrs = t.strftime("%I:%M")
  days = t.strftime("%A")

  sch = Scheduler.find(5)
  listday = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
  ll = []
  if (sch.sun == true)
    ll.push("Sunday")
  end
  if (sch.mon == true)
    ll.push("Monday")
  end
  if (sch.tue == true)
    ll.push("Tuesday")
  end
  if (sch.wed == true)
    ll.push("Wednesday")
  end
  if (sch.thu == true)
    ll.push("Thursday")
  end
  if (sch.fri == true)
    ll.push("Friday")
  end
  if (sch.sat == true)
    ll.push("Saturday")
  end

  if (ll.include?days)
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