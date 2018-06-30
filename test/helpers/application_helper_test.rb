require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Beebings"
    assert_equal full_title("Halp"), "Halp | Beebings"
  end
end