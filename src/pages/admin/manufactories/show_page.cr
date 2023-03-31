class Admin::Manufactories::ShowPage < MainLayout
  needs manufactory : Manufactory
  needs workshops : WorkshopQuery

  def content
    link "返回工厂列表", Index.with(company_id: manufactory.company_id)

    h1 manufactory.name

    link "新车间", to: Admin::Workshops::New.with(manufactory.id)

    mount WorkshopList, records: workshops

    section do
      link "编辑", Edit.with(manufactory_id: manufactory.id)
      text " | "
      link "删除", Delete.with(manufactory_id: manufactory.id), data_confirm: "确认？"
    end

    ul do
      li do
        text "名称: "
        strong manufactory.name.to_s
      end
    end
  end
end
