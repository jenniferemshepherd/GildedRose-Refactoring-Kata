require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      unless item.name == "Sulfuras, Hand of Ragnaros"
        if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
          decrease_quality_by_1(item) if item.quality > 0
        else
          if item.quality < 50
            increment_quality_by_1(item)
            increase_backstage_pass_quality(item)
          end
        end
        item.sell_in -= 1
        if item.sell_in < 0
          if item.name != "Aged Brie"
            decrease_quality_by_1(item) if item.quality > 0
            item.quality = 0 if item.name == "Backstage passes to a TAFKAL80ETC concert"
          else
            increase_quality_by_1_not_beyond_limit(item)
          end
        end
      end
    end
  end
end

def increment_quality_by_1(item)
  item.quality += 1
end

def decrease_quality_by_1(item)
  item.quality -= 1
end

def increase_quality_by_1_not_beyond_limit(item)
  increment_quality_by_1(item) if item.quality < 50
end

def increase_backstage_pass_quality(item)
  if item.name == "Backstage passes to a TAFKAL80ETC concert"
      increase_quality_by_1_not_beyond_limit(item) if item.sell_in < 11
      increase_quality_by_1_not_beyond_limit(item) if item.sell_in < 6
  end
end
