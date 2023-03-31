class CompanyList < BaseComponent
  needs records : CompanyQuery

  def render
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
        records.each do |record|
          tr do
            td record.id

            td do
              link record.name, Admin::Companies::Show.with(record)
            end

            td record.creation_date

            td do
              link "编辑", Admin::Companies::Edit.with(record.id)
            end

            td do
              link "删除", Admin::Companies::Delete.with(record.id), data_confirm: "删除公司 #{record.name} 同时会删除下属的工厂、车间、生产线，确认？"
            end
          end
        end
      end
    end
  end
end
