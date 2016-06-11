class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :item_type

  def initialize(description, options={})
    @description = description
    @start_date = Date.parse(Chronic.parse(options[:start_date]).to_s) if options[:start_date]
    @end_date = Date.parse(Chronic.parse(options[:end_date]).to_s) if options[:end_date]
    @item_type = "event"
  end

  def details
    format_description(@description) + "event dates: " + format_date(@start_date, @end_date)
  end
end
