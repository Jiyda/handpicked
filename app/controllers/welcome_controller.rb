class WelcomeController < ApplicationController
  def index
  	@services = Service.all
  end

  def search
  	@search = Service.search(params[:q])
  	@services = @search.result
  end

  def my_favorites
  	@providers = Vote.where(:voter_id =>current_user.id,:vote_flag => true).map(&:provider)
  end
end
