class ActsAsVotable::Vote < ActiveRecord::Base
	belongs_to :votable, :polymorphic => true
	belongs_to :provider,:class_name=>"Provider",:foreign_key => :votable_id
end