class Admin::Manufactories::ShowPage < MainLayout
  needs manufactory : Manufactory
  needs workshops : WorkshopQuery

  def content
    link "返回工厂列表", Index.with(company_id: manufactory.company_id)
    h1 manufactory.name

    link "新车间", to: Admin::Workshops::New.with(manufactory.id)

    mount RecordList,
      records: workshops,
      show: ::Admin::Workshops::Show,
      edit: ::Admin::Workshops::Edit,
      delete: ::Admin::Workshops::Delete

    section do
      link "编辑", Edit.with(manufactory_id: manufactory.id)
      text " | "
      link "删除", Delete.with(manufactory_id: manufactory.id), data_confirm: "确认？"
    end
  end
end
