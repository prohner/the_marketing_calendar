# == Schema Information
#
# Table name: steps
#
#  id            :integer          not null, primary key
#  title         :string
#  tactic_id     :integer
#  department_id :integer
#  starts_on     :datetime
#  ends_on       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
