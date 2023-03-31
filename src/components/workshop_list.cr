class WorkshopList < BaseComponent
  needs records : WorkshopQuery

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
              link record.name, Admin::Workshops::Show.with(record)
            end

            td record.creation_date

            td do
              link "编辑", Admin::Workshops::Edit.with(record.id)
            end

            td do
              link "删除", Admin::Workshops::Delete.with(record.id), data_confirm: "删除车间 #{record.name} 同时会删除下属的生产线，确认？"
            end
          end
        end
      end
    end
  end
end