class Provider < ActiveRecord::Base
	acts_as_votable
	has_many :votes, :as => :votable
	belongs_to :service
	validates :name, :description, presence: true
	default_scope { order('weighted_score DESC') } 

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
    self.update(:weighted_score => weighted_score)
  end
end	
