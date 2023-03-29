class Admin::Manufactories::Delete < BrowserAction
  delete "/admin/manufactories/:manufactory_id" do
    plain_text "Render something in Admin::Manufactories::Delete"
  end
end
