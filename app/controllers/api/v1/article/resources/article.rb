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
      article = Article.create(title:params[:title],body:params[:body], author_id:params[:author_id])
      unless params[:tag].nil?
        params[:tag].each do |t|
          ArticleTag.create(article_id:article.id, tag_id:t[:id])
        end
      end
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
      Article.find(params[:id]).update(title:params[:title],body:params[:body],author_id:params[:author_id])
      if params[:tag].nil? #jika params tag kosong, article tanpa tag
        ArticleTag.where("article_id = ?", params[:id]).each do|at|
          at.destroy
        end
      else
        #hapus semua tag terkait article
        ArticleTag.where("article_id = ?", params[:id]).each do|at|
          at.destroy
        end
        #tambahkan tag
        params[:tag].each do |t|
          ArticleTag.create(article_id:params[:id], tag_id:t[:id])
        end
      end
    end
    delete do
      Article.find(params[:id]).destroy
    end
  end
end