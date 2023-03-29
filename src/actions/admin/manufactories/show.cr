class Admin::Manufactories::Show < BrowserAction
  get "/admin/manufactories/:manufactory_id" do
    plain_text "Render something in Admin::Manufactories::Show"
  end
end
