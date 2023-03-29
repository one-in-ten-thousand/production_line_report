class Admin::Manufactories::Edit < BrowserAction
  get "/admin/manufactories/:manufactory_id/edit" do
    plain_text "Render something in Admin::Manufactories::Edit"
  end
end
