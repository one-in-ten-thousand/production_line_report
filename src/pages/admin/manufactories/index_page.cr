class Admin::Manufactories::IndexPage < MainLayout
  needs manufactories : ManufactoryQuery
  quick_def page_title, "工厂列表"

  def content
    h1 "工厂列表"

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
        manufactories.each do |manufactory|
          tr do
            td manufactory.id

            td do
              link manufactory.name, Show.with(manufactory.id)
            end

            td manufactory.creation_date

            td do
              link "编辑", Edit.with(manufactory.id)
            end

            td do
              link "删除公司", Delete.with(manufactory.id), data_confirm: "删除工厂 <%= manufactory.name %> 同时会删除下属的车间、生产线，确认？"
            end
          end
        end
      end
    end
  end
end
