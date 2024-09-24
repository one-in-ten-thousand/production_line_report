class RecordList < BaseComponent
  needs records : ManufactoryQuery | WorkshopQuery | ProcessLineQuery | CompanyQuery
  needs show : Lucky::Action.class
  needs edit : Lucky::Action.class
  needs delete : Lucky::Action.class
  needs delete_msg : String

  def render
    s = show
    e = edit
    d = delete

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
              case s
              when Admin::Manufactories::Show.class
                link record.as(Manufactory).name, s.with(record.as(Manufactory))
              when Admin::Workshops::Show.class
                link record.as(Workshop).name, s.with(record.id)
              when Admin::ProcessLines::Show.class
                link record.as(ProcessLine).name, s.with(record.id)
              when Admin::Companies::Show.class
                link record.as(Company).name, s.with(record.id)
              end
            end

            td record.creation_date

            td do
              case e
              when Admin::Manufactories::Edit.class
                link "编辑", e.with(record.id)
              when Admin::Workshops::Edit.class
                link "编辑", e.with(record.id)
              when Admin::ProcessLines::Edit.class
                link "编辑", e.with(record.id)
              when Admin::Companies::Edit.class
                link "编辑", e.with(record.id)
              end
            end

            td do
              case d
              when Admin::Manufactories::Delete.class
                link "删除", d.with(record.id), data_confirm: delete_msg
              when Admin::Workshops::Delete.class
                link "删除", d.with(record.id), data_confirm: delete_msg
              when Admin::ProcessLines::Delete.class
                link "删除", d.with(record.id), data_confirm: delete_msg
              when Admin::Companies::Delete.class
                link "删除", d.with(record.id), data_confirm: delete_msg
              end
            end
          end
        end
      end
    end
  end
end
