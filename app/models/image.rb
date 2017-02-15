class Image < ActiveRecord::Base
  has_many :tags
  has_many :users, through: :tags

  validates :owner_id, :presence => true
end
