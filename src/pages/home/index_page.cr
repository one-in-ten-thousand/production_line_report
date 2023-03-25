class Home::IndexPage < AuthLayout
  def content
    body do
      h1 "Hello"

      a "Login in", href: SignUps::New.path, class: "btn"
    end
  end
end
