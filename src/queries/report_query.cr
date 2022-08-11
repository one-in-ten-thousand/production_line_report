class ReportQuery < Report::BaseQuery
  def initialize
    defaults &.id.desc_order
  end
end
