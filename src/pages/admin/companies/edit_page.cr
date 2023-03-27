class Admin::Companies::EditPage < MainLayout
  needs operation : SaveCompany
  needs company : Company
  quick_def page_title, "编辑公司 ID: #{company.id}"

  def content
    h1 "编辑"
    link "返回", Index

    form_for Update.with(company.id) do
      mount Company::FormFields, operation

      submit "提交", data_disable_with: "更新中..."
    end
  end
end
