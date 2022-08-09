class UnqualifiedProductFactory < Avram::Factory
  def initialize
    name sequence("UnqualifiedProduct")
    place UnqualifiedProduct::Place.values.sample
    reason UnqualifiedProduct::Reason.values.sample

    before_save do
      if operation.report_id.value.nil?
        report_id ReportFactory.create.id
      end
    end
  end
end
