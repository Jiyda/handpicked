class Service < ActiveRecord::Base
	belongs_to :category
	has_many :providers
	validates :name, presence: true
end
