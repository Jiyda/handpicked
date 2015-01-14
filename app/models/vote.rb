class ActsAsVotable::Vote < ActiveRecord::Base
	after_save :update_weighted_score
	belongs_to :votable, :polymorphic => true
	belongs_to :provider,:class_name=>"Provider",:foreign_key => :votable_id

	def raw_score
    return self.get_upvotes.size - self.get_downvotes.size
  end

  def weighted_score
    raw_score = self.raw_score
    order = Math.log([raw_score.abs, 1].max, 10)
    if raw_score > 0
        sign = 1
    elsif raw_score < 0
        sign = -1
    else
        sign = 0
    end
    seconds = self.created_at.to_i - 1134028003
    return ((order + sign * seconds / 45000)*7).ceil / 7.0
  end

  def update_weighted_score
  	byebug
    self.weighted_score = weighted_score
  end

end