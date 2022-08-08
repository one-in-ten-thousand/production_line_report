require "./config/*"
require "./graphql/query_type"
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

basic_auth BASIC_AUTH_USERNAME, BASIC_AUTH_PASSWORD

get "/" do |env|
  render_admin("home.ecr")
end

get "/admin" do |env|
  name = env.kemal_authorized_username?
  render_admin "admin/home.ecr"
end

post "/" do |env|
  name = env.kemal_authorized_username?
  render_admin "admin/home.ecr"
end

include Admin::CompanyController
include Admin::ManufactoryController
include Admin::WorkshopController
include Admin::ProcessLineController
include GraphqlController

Kemal.run
