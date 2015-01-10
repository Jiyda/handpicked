class Provider < ActiveRecord::Base
	belongs_to :service
	validates :name, :description, presence: true
end	
