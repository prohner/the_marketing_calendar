# == Schema Information
#
# Table name: departments
#
#  id              :integer          not null, primary key
#  department_name :string
#  team_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
