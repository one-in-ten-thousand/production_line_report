class Admin::Workshops::Update < BrowserAction
  put "/admin/workshops/:workshop_id" do
    workshop = WorkshopQuery.find(workshop_id)
    SaveWorkshop.update(workshop, params) do |operation, updated_workshop|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_workshop.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, workshop: updated_workshop
      end
    end
  end
end
