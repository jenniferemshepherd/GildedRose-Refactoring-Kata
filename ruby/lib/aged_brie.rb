class AgedBrie

  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @quality += 1 if @sell_in >= 0
    @quality += 2 if @sell_in < 0
  end

  def update_sell_in
    @sell_in -= 1
  end

end