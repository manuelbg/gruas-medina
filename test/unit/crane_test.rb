require 'test_helper'

class CraneTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Crane.new.valid?
  end
end
