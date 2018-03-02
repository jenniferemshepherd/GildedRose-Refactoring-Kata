require_relative 'item'

class GildedRose

  QUALITYLIMIT = 50
  # QUALITY_ALTER = 1

  def initialize(items)
    @items = items
  end

  def update_items()
    @items.each do |item|
      item.update_item
    end
  end

  def update_quality()
    @items.each do |item|
      unless item.name == "Sulfuras, Hand of Ragnaros"
        if item_that_increases_in_quality(item)
          increase_quality_by_1_not_beyond_limit(item)
          increase_backstage_pass_quality(item)
        else
          decrease_quality_by_1(item) if item.quality > 0
        end
        decrease_sell_in(item)
        past_sell_in(item)
      end
    end
  end

  def item_that_increases_in_quality(item)
    item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def increment_quality_by_1(item)
    item.quality += 1
  end

  def decrease_quality_by_1(item)
    item.quality -= 1
  end

  def increase_quality_by_1_not_beyond_limit(item)
    increment_quality_by_1(item) if item.quality < QUALITYLIMIT
  end

  def increase_backstage_pass_quality(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
        increase_quality_by_1_not_beyond_limit(item) if item.sell_in < 11
        increase_quality_by_1_not_beyond_limit(item) if item.sell_in < 6
    end
  end

  def past_sell_in(item)
    if item.sell_in < 0
      if item.name == "Aged Brie"
        increase_quality_by_1_not_beyond_limit(item)
      else
        decrease_quality_by_1(item) if item.quality > 0
        item.quality = 0 if item.name == "Backstage passes to a TAFKAL80ETC concert"
      end
    end
  end
end
