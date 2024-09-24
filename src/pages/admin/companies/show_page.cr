class Admin::Companies::ShowPage < AdminLayout
  needs company : Company
  needs manufactories : ManufactoryQuery
  quick_def page_title, "详情"

  def content
    link "返回公司列表", Index

    h1 company.name

    link "新工厂", to: Admin::Manufactories::New.with(company_id: company.id)

    mount RecordList,
      records: manufactories,
      show: Admin::Manufactories::Show,
      edit: Admin::Manufactories::Edit,
      delete: Admin::Manufactories::Delete,
      delete_msg: "删除工厂同时会删除下属的车间、生产线，确认？"

    section do
      link "编辑", Edit.with(company_id: company.id)
      text " | "
      link "删除", Delete.with(company.id), data_confirm: "删除公司 #{company.name} 同时会删除下属的工厂、车间、生产线，确认？"
    end

    ul do
      li do
        text "名称: "
        strong company.name.to_s
      end
    end
  end
end
