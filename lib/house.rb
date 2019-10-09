class House
  attr_reader :price, :address, :rooms
  def initialize(price, address, rooms = [])
    @price = reformat_price(price)
    @address = address
    @rooms = rooms
  end

  def reformat_price(input_price)
    input_price.gsub("$", "").to_i
  end
  
  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.map do |room|
      if room.category == category
        room
      end
    end
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.length * room.width
    end
    total_area
  end

  def price_per_square_feet
    total_area = area
    @price / total_area
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}
  end

  def rooms_sorted_by_category
    @rooms.sort_by {|room| room.category}.reverse
  end
end