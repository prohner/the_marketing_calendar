# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  starts_on  :datetime
#  ends_on    :datetime
#  revenue    :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  has_many :tactics
  belongs_to :team
end
