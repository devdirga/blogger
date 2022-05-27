class Api::V1::Article::Resources::Article < Grape::API
  helpers Api::V1::Article::Params::Article
  resource :article do
    get do
      present Article.all, with: Api::V1::Article::Entities::Article
    end
    get ":id" do
      Article.find(params[:id])
    end
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
        permissions: { print_document: false, modify_contents: false, copy_contents: false, modify_annotations: false }
      )
      pdf.render_file(params[:title] + ".pdf")
      article
    end
    params do
      use :article_params
    end
    put do
      Article.find(params[:id]).update(params)
    end
    delete do
      Article.find(params[:id]).destroy
    end
  end
end