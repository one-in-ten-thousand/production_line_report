class Admin::Workshops::Delete < BrowserAction
  delete "/admin/workshops/:workshop_id" do
    workshop = WorkshopQuery.find(workshop_id)
    DeleteWorkshop.delete(workshop) do |_operation, _deleted|
      flash.success = "Deleted the workshop"
      redirect Index.with(workshop.manufactory_id)
    end
  end
end
