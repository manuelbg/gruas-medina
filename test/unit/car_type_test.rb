require 'test_helper'

class CarTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CarType.new.valid?
  end
end
