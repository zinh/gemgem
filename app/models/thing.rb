class Thing < ActiveRecord::Base
  has_many :comments
  scope :latest, -> {order(created_at: :desc).limit(10)}
end
