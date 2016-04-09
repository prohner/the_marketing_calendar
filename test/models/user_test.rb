# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string
#  first_name    :string
#  last_name     :string
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "the full name is constructed properly" do
    u = User.new(first_name: 'joseph', last_name: 'blow')
    assert(u.full_name == 'joseph blow', 'Failed to construct full name correctly')
  end
end
