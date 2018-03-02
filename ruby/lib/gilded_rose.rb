require_relative 'item'

class GildedRose

  QUALITYLIMIT = 50
  # QUALITY_ALTER = 1

  def initialize(items)
    @items = items
  end

  def update
    @items.each do |item|
      item.update
    end
  end
end
