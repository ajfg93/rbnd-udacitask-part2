module UdaciListErrors  #namespace
  # Error classes go here
  class InvalidItemTypeError < StandardError
  end

  class IndexExceedsListSizeError < StandardError
  end

  class InvalidPriorityValueError < StandardError
  end
end
