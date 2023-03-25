class Admin::Home::Index < BrowserAction
  get "/admin/home" do
    html Admin::Home::IndexPage, name: current_user.email
  end
end
