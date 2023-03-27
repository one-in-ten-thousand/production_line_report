class Admin::Companies::NewPage < MainLayout
  needs operation : SaveCompany
  quick_def page_title, "新增"

  def content
    h1 "新增"
    link "返回", Index

    form_for Create do
      # Edit fields in src/components/fortunes/form_fields.cr
      mount Company::FormFields, operation

      submit "提交", data_disable_with: "保存中..."
    end
  end
end
