class Authorization < ActiveRecord::Base
  validates_presence_of :uid
  validates_uniqueness_of :uid

  belongs_to :user
end
