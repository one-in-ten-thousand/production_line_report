class Admin::ProcessLines::Create < BrowserAction
  post "/admin/workshops/:workshop_id/process_lines" do
    SaveProcessLine.create(params) do |operation, process_line|
      if process_line
        flash.success = "The record has been saved"
        redirect Show.with(process_line.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation, workshop_id: workshop_id
      end
    end
  end
end
