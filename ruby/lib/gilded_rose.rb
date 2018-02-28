require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          backstage_pass_quality_increases(item)
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          item.quality = 0 if item.name == "Backstage passes to a TAFKAL80ETC concert"
        else
          increase_quality_by_1_not_beyond_limit(item)
        end
      end
    end
  end
end

def increase_quality_by_1_not_beyond_limit(item)
  item.quality += 1 if item.quality < 50
end

def backstage_pass_quality_increases(item)
  if item.name == "Backstage passes to a TAFKAL80ETC concert"
      increase_quality_by_1_not_beyond_limit(item) if item.sell_in < 11
      increase_quality_by_1_not_beyond_limit(item) if item.sell_in < 6
  end
end
