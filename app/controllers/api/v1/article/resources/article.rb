class Api::V1::Article::Resources::Article < Grape::API
  helpers Api::V1::Article::Params::Article
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
    params do
      use :article_params
    end
    post do
      article = Article.create(params)
      rendered = ActionController::Base.new.render_to_string("subscriber_mailer/welcome_email", locals: { :@article => article })
      pdf = Prawn::Document.new
      PrawnHtml.append_html(pdf, rendered)
      pdf.encrypt_document(
        user_password: "admin123",
        owner_password: "admin123",
        permissions: { print_document: false, modify_contents: false, copy_contents: false, modify_annotations: false }
      )
      pdf.render_file(params[:title] + ".pdf")
      author = Author.find_by_email(params[:author])
      subscriptions = Subscription.where(author_id: author.id)
      subscriptions.each do|subscription|
        subscriber = Subscriber.find(subscription.subscriber_id)
        # ::TesMailer.send_email_subscriber(subscriber, author, article)
        # Scheduler.create(clock:params[:clock],sun:params[:sun],mon:params[:mon],tue:params[:tue],wed:params[:wed],thu:params[:thu],fri:params[:fri],sat:params[:sat])
      end
    end
    desc "Update"
    params do
      use :article_params
    end
    put do
      Article.find(params[:id]).update(params)
    end
    desc "Delete"
    delete do
      Article.find(params[:id]).destroy
    end
  end
end