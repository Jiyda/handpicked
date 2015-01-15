class Service < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :providers
	validates :name, presence: true

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
self.per_page = 25
end
