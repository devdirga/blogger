class Api::V1::Scheduler::Resources::Scheduler < Grape::API
  helpers Api::V1::Scheduler::Params::Scheduler

  resource :scheduler do
    get do
      present Scheduler.all, with: Api::V1::Scheduler::Entities::Scheduler
    end
    params do
      use :scheduler_params
    end
    post do
      Scheduler.create(params)
    end
    put do
      Scheduler.find(params[:id]).update(params)
    end
  end

  resource :articlelist do
    get do
      tags = Article.select("articles.title as title , a2.name as authorname , string_agg(t2.title, ',') as tagname")
                   .joins("LEFT JOIN authors a2 ON articles.author_id = a2.id")
                   .joins("LEFT JOIN article_tags t ON articles.id = t.article_id")
                   .joins("LEFT JOIN tags t2 ON t.tag_id = t2.id").group(:title , :authorname)
      p = Axlsx::Package.new
      p.workbook.add_worksheet(:name => "Basic Worksheet") do |s|
        s.add_row ["Article Title", "Article Author", "Tag"]
        tags.each do |article|
          s.add_row [article[:title], article[:authorname], article[:tagname]]
        end
      end
      p.use_shared_strings = true
      p.serialize('article_report.xlsx')
      tags
    end
  end

  resource :taglist do
    get do
      articles = Article.select("articles.title as title , a2.name as authorname , string_agg(t2.title, ',') as tagname")
                        .joins("LEFT JOIN authors a2 ON articles.author_id = a2.id")
                        .joins("LEFT JOIN article_tags t ON articles.id = t.article_id")
                        .joins("LEFT JOIN tags t2 ON t.tag_id = t2.id").group(:title , :authorname)
      p = Axlsx::Package.new
      p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
        sheet.add_row ["Article Title", "Article Author", "Tag"]
        articles.each do |article|
          sheet.add_row [article[:title], article[:authorname], article[:tagname]]
        end
      end
      p.use_shared_strings = true
      p.serialize('article_report.xlsx')
      articles
    end
  end

end