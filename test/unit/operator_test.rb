require 'test_helper'

class OperatorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Operator.new.valid?
  end
end
