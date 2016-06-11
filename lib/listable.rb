module Listable
  # Listable methods go here
  def format_description (description)
    "#{description}".ljust(25)
  end

  def format_date (date_01, date_02 = nil)
    if date_02
      dates = date_01.strftime("%D") if date_01
      dates << " -- " + date_02.strftime("%D") if date_02
      dates = "N/A" if !dates
      return dates
    else
      return date_01 ? date_01.strftime("%D") : "No due date"
    end
  end

  def format_priority (priority)
    value = " ⇧" if priority == "high"
    value = " ⇨" if priority == "medium"
    value = " ⇩" if priority == "low"
    value = "" if !priority
    return value
  end

end
