# == Schema Information
#
# Table name: things
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Thing < ActiveRecord::Base
  has_many :comments
  scope :latest, -> {order(created_at: :desc).limit(10)}
end
