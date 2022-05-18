class Api::V1::Article::Resources::Article < Grape::API
  resource :article do
    desc "All"
    get do
      present Article.all, with: Api::V1::Article::Entities::Article
    end
    desc "Get One"
    get ":id" do
      Article.find(params[:id])
    end
    desc "Create"
    post do
      article = Article.create(params)
      rendered = ActionController::Base.new.render_to_string("subscriber_mailer/welcome_email", locals: { :@article => article })
      pdf = Prawn::Document.new
      PrawnHtml.append_html(pdf, rendered)
      pdf.encrypt_document(
        user_password: "admin123",
        owner_password: "admin123",
        permissions: {
          print_document: false,
          modify_contents: false,
          copy_contents: false,
          modify_annotations: false
        }
      )
      pdf.render_file(params[:title] + ".pdf")
      author = Author.find_by_email(params[:author])
      subscriptions = Subscription.where(author_id: author.id)
      subscriptions.each do|subscription|
        subscriber = Subscriber.find(subscription.subscriber_id)

        puts subscriber
        puts author
        puts article

        # SubscriberMailer.mail_to_subscriber(subscriber, author, article).deliver_later
        # MandrillMailer.send_email_subscriber(subscriber, author, article)

        # ::MandrillMailer.send_email
        ::TesMailer.send_email_subscriber(subscriber, author, article)
      end
    end
    desc "Update"
    put do
      article = Article.find(params[:id])
      article.update(title: params[:title],body:params[:body],author:params[:author])
    end
    desc "Delete"
    delete do
      article = Article.find(params[:id])
      article.destroy
    end
  end
end