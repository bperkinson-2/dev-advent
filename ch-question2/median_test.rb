require 'minitest/autorun'
require_relative 'median'

# Common test data version: 1.7.0 cacf1f1
class MedianTest < Minitest::Test
  def test_three
    assert_equal [1, 1.5, 2], MiddleThing.new([1,2,3]).running
  end

  def test_three_out
    assert_equal [2, 1.5, 2], MiddleThing.new([2,1,3]).running
  end

  def test_final
    assert_equal [2, 1.5, 2, 3.5, 2, 2, 2], MiddleThing.new([2, 1, 5, 7, 2, 0, 5]).running
  end
end