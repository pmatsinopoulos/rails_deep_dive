class Event < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  belongs_to :user, :inverse_of => :events

  nilify_blanks

  validates :name, :presence => true
  validates :user, :presence => true
end
