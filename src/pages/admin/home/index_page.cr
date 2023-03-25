class Admin::Home::IndexPage < MainLayout
  needs name : String

  def content
    h1 "Hi, #{name}"
  end
end
