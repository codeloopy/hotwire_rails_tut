require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Name" do
    assert_equal "Accountant", users(:accountant).name
  end
end
