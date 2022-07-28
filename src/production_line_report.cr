require "./config/**"

private macro render_use_layout(filename)
  render "src/views/{{filename.id}}", "src/views/layouts/layout.ecr"
end

get "/admin" do |env|
  name = env.kemal_authorized_username?
  render_use_layout("admin/home.ecr")
end

Kemal.run
