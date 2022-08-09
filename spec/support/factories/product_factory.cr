class ProductFactory < Avram::Factory
  def initialize
    name sequence("Product")
    place_sample = Product::Place.values.sample

    place place_sample

    if place_sample.value == 0
      reason Product::Reason.new(0)
    else
      size = Product::Reason.values.size
      reason Product::Reason.new(rand(1..(size-1)))
    end

    before_save do
      if operation.report_id.value.nil?
        report_id ReportFactory.create.id
      end
    end
  end
end
