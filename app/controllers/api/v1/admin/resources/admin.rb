class Api::V1::Admin::Resources::Admin < Grape::API
  helpers Api::V1::Admin::Params::Admin
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
      tags = Tag.select("tags.title AS tagtitle , COUNT(a2.title) AS articlecount")
                .joins("LEFT JOIN article_tags a ON tags.id = a.tag_id")
                .joins("LEFT JOIN articles a2 ON a.article_id = a2.id").group(:tagtitle).order(articlecount: :desc)
      p = Axlsx::Package.new
      p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
        sheet.add_row ["Tag", "Count Tag"]
        tags.each do |tag|
          sheet.add_row [tag[:tagtitle], tag[:articlecount]]
        end
      end
      p.use_shared_strings = true
      p.serialize('tag_report.xlsx')
      tags
    end
  end
end