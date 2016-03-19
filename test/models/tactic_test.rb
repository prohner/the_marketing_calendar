# == Schema Information
#
# Table name: tactics
#
#  id         :integer          not null, primary key
#  title      :string
#  event_id   :integer
#  channel_id :integer
#  starts_on  :datetime
#  ends_on    :datetime
#  revenue    :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TacticTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
