# frozen_string_literal: true

# Create a class CallCounter that tracks the number of calls a client
# has made within the last 3 seconds.
# Your class should contain one method, ping (int t) that receives the current
# timestamp (in milliseconds) of a new call being made and returns the
# number of calls made within the last 3 seconds.
#
# NOTE: you may assume that the time associated with each subsequent
# call to ping is strictly increasing.

# Ex: Given the following calls to ping…

# ping(1), return 1 (1 call within the last 3 seconds)
# ping(300), return 2 (2 calls within the last 3 seconds)
# ping(3000), return 3 (3 calls within the last 3 seconds)
# ping(3002), return 3 (3 calls within the last 3 seconds)
# ping(7000), return 1 (1 call within the last 3 seconds)

require 'minitest/autorun'

class CallCounter
  INTERVAL = 3000

  def initialize
    @pings = []
  end

  def ping(timestamp)
    pings.append(timestamp)

    count_recent_pings
  end

  private

  attr_reader :pings

  def count_recent_pings
    period_start = pings.last - INTERVAL

    pings.keep_if { |ping| ping >= period_start }.size
  end
end

class TestCallCounter < Minitest::Test
  def test_1
    counter = CallCounter.new

    assert_equal 1, counter.ping(1)
    assert_equal 2, counter.ping(300)
    assert_equal 3, counter.ping(3000)
    assert_equal 3, counter.ping(3002)
    assert_equal 1, counter.ping(7000)
  end
end
