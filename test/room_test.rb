require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/room.rb"

class RoomTest < Minitest::Test
  #setup
  def setup
  @room_1 = Room.new(:bedroom, 130, 5)
  end

  #test it exists
  def test_it_exists
    assert_instance_of Room, @room_1
  end
  #test it returns a symbol on .category
  def test_it_returns_a_category
    assert_equal :bedroom, @room_1.category
  end

  #test it returns the room area integer on .area
  def test_it_returns_an_area
    assert_equal 130, @room_1.area
  end

  def test_it_returns_a_width
    assert_equal 5, @room_1.width
  end
end