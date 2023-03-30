class RecordList < BaseComponent
  needs records : ManufactoryQuery
  needs show : Admin::Manufactories::Show.class
  needs edit : Admin::Manufactories::Edit.class
  needs delete : Admin::Manufactories::Delete.class

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
        records.each do |manufactory|
          tr do
            td manufactory.id

            td do
              link manufactory.name, show.with(manufactory.id)
            end

            td manufactory.creation_date

            td do
              link "编辑", edit.with(manufactory.id)
            end

            td do
              link "删除", delete.with(manufactory.id), data_confirm: "确认？"
            end
          end
        end
      end
    end
  end
end
