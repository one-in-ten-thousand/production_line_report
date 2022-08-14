class ProductFactory < Avram::Factory
  def initialize
    name sequence("衣服")
    place_sample = Product::Place.values[1..-1].sample
    place_sample = [Product::Place::None, place_sample].sample

    place [Product::Place::None, place_sample].sample

    if place_sample.value == 0
      reason Product::Reason.new(0)
    else
      reason Product::Reason.values[1..-1].sample
    end

    before_save do
      if operation.report_date.value.nil?
        start_time = Time.utc(2021, 11, 15)

        time = (1..30).each_with_object([] of Time) do |i, o|
          o << start_time.shift(days: i)
        end.sample

        report_date time.to_s("%F")
        created_at time
      end

      id = operation.process_line_id.value

      if id.nil?
        process_line = ProcessLineFactory.create
      else
        process_line = ProcessLineQuery.new.find(id)
      end

      process_line_id process_line.id
      workshop_id process_line.workshop.id
      manufactory_id process_line.workshop.manufactory.id
      company_id process_line.workshop.manufactory.company.id
    end
  end
end
