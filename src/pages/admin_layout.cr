abstract class AdminLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using AdminLayout
  needs current_user : User

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "首页"
  end

  def build_breadcrumb_link(record_name, record_url)
    link record_url, class: "breadcrumb" do
      span class: "#{current_page?(record_url) ? "black-text" : ""}" do
        text record_name
      end
    end
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body do
        div class: "container" do
          nav do
            div class: "nav-wrapper" do
              div class: "col s12" do
                link Admin::Companies::Index, class: "breadcrumb"
                span class: "#{current_page?(Admin::Companies::Index) ? "black-text" : ""}" do
                  text "公司列表"
                end

                route_params = context.params.@route_params

                process_line_id = route_params["process_line_id"]?
                if process_line_id
                  process_line = ProcessLineQuery.find(process_line_id)
                  process_line_url = Admin::ProcessLines::Show.with(process_line.id)

                  workshop = process_line.workshop
                  workshop_url = Admin::Workshops::Show.with(workshop.id)

                  manufactory = workshop.manufactory
                  manufactory_url = Admin::Manufactories::Show.with(manufactory.id)

                  company = manufactory.company
                  company_url = Admin::Companies::Show.with(company.id)
                end

                workshop_id = route_params["workshop_id"]?
                if workshop_id
                  workshop = WorkshopQuery.find(workshop_id)
                  workshop_url = Admin::Workshops::Show.with(workshop.id)

                  manufactory = workshop.manufactory
                  manufactory_url = Admin::Manufactories::Show.with(manufactory.id)

                  company = manufactory.company
                  company_url = Admin::Companies::Show.with(company.id)
                end

                manufactory_id = route_params["manufactory_id"]?
                if manufactory_id
                  manufactory = ManufactoryQuery.find(manufactory_id)
                  manufactory_url = Admin::Manufactories::Show.with(manufactory.id)

                  company = manufactory.company
                  company_url = Admin::Companies::Show.with(company.id)
                end

                company_id = route_params["company_id"]?
                if company_id
                  company = CompanyQuery.find(company_id)
                  company_url = Admin::Companies::Show.with(company_id)
                end

                # # if responds_to?(:company)
                # #   company
                # # end

                if company_url || manufactory_url || workshop_url || process_line_url
                  build_breadcrumb_link(company.not_nil!.name, company_url.not_nil!)
                end

                if manufactory_url || workshop_url || process_line_url
                  build_breadcrumb_link(manufactory.not_nil!.name, manufactory_url.not_nil!)
                end

                if workshop_url || process_line_url
                  build_breadcrumb_link(workshop.not_nil!.name, workshop_url.not_nil!)
                end

                if process_line_url
                  build_breadcrumb_link(process_line.not_nil!.name, process_line_url)
                end
              end
            end
          end
          mount Shared::FlashMessages, context.flash
          render_signed_in_user
          content
        end
      end
    end
  end

  private def render_signed_in_user
    text current_user.email
    text " - "
    link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button"
  end
end
