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
end
