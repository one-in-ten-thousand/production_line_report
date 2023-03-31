class Admin::Companies::EditPage < MainLayout
  needs operation : SaveCompany
  needs company : Company
  quick_def page_title, "编辑公司 ID: #{company.id}"

  def content
    link "所有公司", Index

    h1 "编辑公司"

    form_for Update.with(company) do
      mount FormFields, operation

      submit "修改", data_disable_with: "更新中..."
    end
  end
end
