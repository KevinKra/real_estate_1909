class Room
  attr_reader :category, :area, :width
  def initialize(category, area, width)
    @category = category
    @area = area
    @width = width
  end
end