class Image < ActiveRecord::Base

  has_attached_file :paperclip, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :paperclip, :content_type => /\Aimage\/.*\Z/

  has_many :tags
  has_many :users, through: :tags

  validates :owner_id, :presence => true

end
