class Admin::Manufactories::NewPage < MainLayout
  needs operation : SaveManufactory
  needs company_id : String

  def content
    h1 "新增"
    link "返回", Index.with(company_id: company_id)

    form_for Create.with(company_id: company_id) do
      # Edit fields in src/components/fortunes/form_fields.cr
      mount Manufactory::FormFields, operation

      submit "提交", data_disable_with: "保存中..."
    end
  end
end
