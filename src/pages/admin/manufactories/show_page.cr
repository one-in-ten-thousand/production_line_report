class Admin::Manufactories::ShowPage < MainLayout
  needs manufactory : Manufactory

  def content
    link "返回工厂列表", Index.with(company_id: manufactory.company_id)
    h1 manufactory.name

    # link "新车间", to: Admin::Workshops::New.with(manufactory_id: manufactory_id)

    # mount Record
    section do
      link "编辑", Edit.with(manufactory_id: manufactory.id)
      text " | "
      link "删除", Delete.with(manufactory_id: manufactory.id), data_confirm: "确认？"
    end
  end
end
