class Admin::Workshops::Create < BrowserAction
  post "/admin/manufactories/:manufactory_id/workshops" do
    SaveWorkshop.create(params, manufactory_id: manufactory_id.to_i64) do |operation, workshop|
      if workshop
        flash.success = "The record has been saved"
        redirect Show.with(workshop.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation, manufactory_id: manufactory_id
      end
    end
  end
end
