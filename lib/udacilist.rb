class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    # @title = options[:title] ? options[:title] : "Untitled List"
    @title = options[:title] 
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
      indexes_delete = indexes_delete.map {|index_delete| index_delete += 1}
      indexes_delete.each do |index_delete|
        items_delete << @items[index_delete]
      end
      items_delete.each do |item_delete|
        @items.delete(item_delete)
      end
  end

  def all (type = nil)
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    if type
      @items.each_with_index do |item, position|
        puts "#{position + 1}) [#{item.itemtype}] #{item.details}" if item.itemtype == type
      end
    else
      @items.each_with_index do |item, position|
        puts "#{position + 1}) [#{item.itemtype}] #{item.details}"
      end
    end
  end

  def filter(type)
    type = type.downcase
    all(type)
  end
end
