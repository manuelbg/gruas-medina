require 'test_helper'

class CarBrandTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CarBrand.new.valid?
  end
end
