# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  department_id          :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
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

  test "email should be required" do
    u = User.new(first_name: 'joseph', last_name: 'blow')
    assert_not u.valid?
  end

  test "email should be lower cased" do
    t = Team.create!(team_name: 'team')
    d = Department.create!(department_name: 'dept', team: t)
    u = User.create!(first_name: 'joseph', last_name: 'blow', email: 'A@B.COM', password: 'secret123', password_confirmation: 'secret123', department: d)
    assert(u.email == 'a@b.com', 'Email address should be lower cased')
  end
end
