# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  email :string
#

class User < ActiveRecord::Base
  has_many :comments
end
