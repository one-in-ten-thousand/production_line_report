class Admin::Companies::NewPage < MainLayout
  needs operation : SaveCompany
  quick_def page_title, "新增公司"

  def content
    link "所有公司", Index

    h1 page_title

    form_for Create do
      mount FormFields, operation

      submit "提交", data_disable_with: "保存中..."
    end
  end
end
