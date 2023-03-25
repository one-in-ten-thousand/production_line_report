class Home::Index < BrowserAction
  include Auth::AllowGuests

  get "/" do
    if current_user?
      redirect Admin::Home::Index
    else
      html Home::IndexPage
    end
  end
end
