class Admin::Companies::IndexPage < MainLayout
  needs companies : CompanyQuery
  quick_def page_title, "列表"

  def content
    h1 "公司列表"

    link "新公司", to: New

    table class: "highlight centered" do
      thead do
        tr do
          th "ID"
          th "名称"
          th "创建时间"
          th colspan: 2
        end
      end

      tbody do
        companies.each do |company|
          tr do
            td company.id

            td do
              link company.name, Show.with(company.id)
            end

            td company.creation_date

            td do
              link "编辑", Edit.with(company.id)
            end

            td do
              link "删除公司", Delete.with(company.id), data_confirm: "删除公司 <%= company.name %> 同时会删除下属的工厂、车间、生产线，确认？"
            end
          end
        end
      end
    end
  end
end
