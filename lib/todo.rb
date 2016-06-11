class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :item_type
  @@priorities = ["high","medium","low",nil]
  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(Chronic.parse(options[:due]).to_s) : options[:due]
    @priority = options[:priority]
    if !@@priorities.include?(@priority)
      raise UdaciListErrors::InvalidPriorityValueError, "We don't have such a '#{@priority}' priority option"
    end
    @item_type = "todo"
  end

  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end
end
