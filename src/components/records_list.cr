class RecordList < BaseComponent
  needs records : ManufactoryQuery | WorkshopQuery
  needs show : Admin::Manufactories::Show.class | Admin::Workshops::Show.class
  needs edit : Admin::Manufactories::Edit.class | Admin::Workshops::Edit.class
  needs delete : Admin::Manufactories::Delete.class | Admin::Workshops::Delete.class

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
              link record.name, show.with(record)
            end

            td record.creation_date

            td do
              link "编辑", edit.with(record.id)
            end

            td do
              link "删除", delete.with(record.id), data_confirm: "确认？"
            end
          end
        end
      end
    end
  end
end
