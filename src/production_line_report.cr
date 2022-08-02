require "./config/*"
require "./controllers/**"

private macro render_admin(filename)
  render "src/views/{{filename.id}}", "src/views/layouts/admin.ecr"
end

macro render_partial(filename)
  render "src/views/partials/{{filename.id}}"
end

def link_to(title, href)
  "<a href=\"#{href}\">#{title}</a>"
end

path = RoutePath.new

basic_auth "admin", "123456"

get "/" do |env|
  render_admin("home.ecr")
end

get "/admin" do |env|
  name = env.kemal_authorized_username?
  render_admin "admin/home.ecr"
end

include Admin::CompanyController
include Admin::ManufactoryController

Kemal.run
