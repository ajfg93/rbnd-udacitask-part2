class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if type == "todo"
    @items.push TodoItem.new(description, options)
    elsif type == "event"
    @items.push EventItem.new(description, options)
    elsif type == "link"
    @items.push LinkItem.new(description, options)
    else
    raise UdaciListErrors::InvalidItemTypeError, "#{type} is a invalid type"
    end
  end
  def delete(index)
    if index > @items.length
      raise UdaciListErrors::IndexExceedsListSizeError, "Item #{index} doesn't exist"
    else
    @items.delete_at(index - 1)
    end
  end

  def delete_some_items(*indexes_delete)
      items_delete = []
      indexes_delete = indexes_delete.map {|index_delete| index_delete -= 1}
      indexes_delete.each do |index_delete|
        items_delete << @items[index_delete]
      end
      items_delete.each do |item_delete|
        @items.delete(item_delete)
      end
  end

  def change_event_priority(index, new_priority)
    if index >= @items.length
       raise UdaciListErrors::IndexExceedsListSizeError, "Item #{index} doesn't exist"
    end
    if @items[index-1].item_type != "todo"
       raise UdaciListErrors::InvalidItemTypeError, "#{@items[index-1]} is a #{@items[index-1].item_type} item, not a 'todo' item"
    end
    if !TodoItem.priorities.include?(new_priority)
      raise UdaciListErrors::InvalidPriorityValueError, "We don't have such a '#{new_priority}' priority option"
    end
    @items[index-1].priority = new_priority
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) [#{item.item_type}] #{item.details}"
    end
  end
end
