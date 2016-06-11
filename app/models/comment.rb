# == Schema Information
#
# Table name: comments
#
#  id       :integer          not null, primary key
#  body     :text
#  thing_id :integer
#  user_id  :integer
#

class Comment < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
