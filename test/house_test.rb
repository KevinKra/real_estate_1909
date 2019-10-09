require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/house.rb"
require_relative "../lib/room.rb"

class RoomTest < Minitest::Test
  #setup
  def setup 
    @house = House.new("$400000", "123 sugar lane")
  end
  #test it exists
  def test_it_exists
    assert_instance_of House, @house
  end

  #test it returns an integer .price
  def test_it_returns_a_price
    # NOTE: Convert to integer 400000
    assert_equal 400000, @house.price
  end

  #test it returns a string .address
  def test_it_returns_an_address
    assert_equal "123 sugar lane", @house.address
  end

  #test it returns an array of .rooms
  def test_it_returns_default_rooms
    assert_equal [], @house.rooms
  end

  #test it adds rooms to .rooms when .add_room is called
  def test_it_adds_to_rooms_when_add_room_called
   room_1 = Room.new(:bedroom, 10, 13)
   room_2 = Room.new(:bedroom, 8, 15)
   @house.add_room(room_1)
   assert_equal [room_1], @house.rooms
   @house.add_room(room_2)
   assert_equal [room_1, room_2], @house.rooms
  end

  def test_it_updates_the_rooms_attr
    room_1 = Room.new(:bedroom, 8, 15)
    @house.add_room(room_1)
    assert_equal [room_1], @house.rooms
  end

  def test_it_returns_an_array_of_matching_rooms
    room_1 = Room.new(:bedroom, 8, 15)
    room_2 = Room.new(:attic, 5, 3)
    @house.add_room(room_1)
    assert_equal [room_1], @house.rooms_from_category(:bedroom)
  end

  def test_it_returns_the_area_of_the_house
    room_1 = Room.new(:bedroom, 1, 2)
    room_2 = Room.new(:attic, 1, 2)
    room_3 = Room.new(:attic, 1, 2)
    @house.add_room(room_1)
    @house.add_room(room_2)
    assert_equal 4, @house.area
    @house.add_room(room_3)
    assert_equal 6, @house.area
  end

  def test_it_returns_the_price_per_square_feet
    room_1 = Room.new(:bedroom, 1, 2)
    room_2 = Room.new(:attic, 1, 2)
    @house.add_room(room_1)
    @house.add_room(room_2)
    # 400000 / 4 = 100000
    assert_equal 100000, @house.price_per_square_feet
  end

  def test_it_returns_rooms_sorted_by_area
    room_1 = Room.new(:bedroom, 5, 5)
    room_2 = Room.new(:attic, 1, 3)
    @house.add_room(room_1)
    @house.add_room(room_2)
    # smallest -> largest
    assert_equal [room_2, room_1], @house.rooms_sorted_by_area
  end

  def test_it_returns_rooms_sorted_by_category
    room_1 = Room.new(:bedroom, 5, 5)
    room_2 = Room.new(:attic, 1, 3)
    @house.add_room(room_1)
    @house.add_room(room_2)
    # smallest -> largest
    assert_equal [room_1, room_2], @house.rooms_sorted_by_category
  end
end