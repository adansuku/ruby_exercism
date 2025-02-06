class BoutiqueInventory
  CHEAP_PRICE = 30

  def initialize(items)
    @items = items
  end

  def item_names
    items.map {|item| item[:name]}.sort
  end

  def cheap
    items.select { |item| item[:price] < CHEAP_PRICE }
  end

  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    item = @items.find { |item| item[:name] == name }
    item ? item[:quantity_by_size] : {}
  end

  def total_stock
    items.sum do |item|
      item[:quantity_by_size].values.sum
    end
  end

  private
  attr_reader :items
end
