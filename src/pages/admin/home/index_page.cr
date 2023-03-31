class Admin::Home::IndexPage < AdminLayout
  needs name : String

  def content
    h1 "Hi, #{name}"
  end
end
