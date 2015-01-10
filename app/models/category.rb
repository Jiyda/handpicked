class Category < ActiveRecord::Base
	has_many :services
	validates :name, uniqueness: true
end
