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

class Tactic < ApplicationRecord
  belongs_to :event
  has_many :steps
  has_many :tactic_comments
  belongs_to :channel
end
