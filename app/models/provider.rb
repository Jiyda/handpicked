class Provider < ActiveRecord::Base
	acts_as_votable
	has_many :votes, :as => :votable
	belongs_to :service
	validates :name, :description, presence: true
end	
