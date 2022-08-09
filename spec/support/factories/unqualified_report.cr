class UnqualifiedProductFactory < Avram::Factory
  def initialize
    place UnqualifiedProduct::Place.values.sample
    reason UnqualifiedProduct::Reason.values.sample
  end
end
