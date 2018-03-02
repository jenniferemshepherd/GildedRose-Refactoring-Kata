class Conjured
  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update
    update_sell_in
    update_quality
  end

  def update_quality
    @quality -= 2
  end

  def update_sell_in
    @sell_in -= 1
  end
end
