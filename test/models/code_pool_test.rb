require "test_helper"

class CodePoolTest < ActiveSupport::TestCase
  test 'should generate a code' do
    assert_difference('CodePool.count') do
      CodePool.generate
    end
  end
end
