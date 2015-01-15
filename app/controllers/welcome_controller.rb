class WelcomeController < ApplicationController
  def index
  	# @services = Service.all
    @services = Service.all.page(params[:page])
  end

  def search
  	@search = Service.search(params[:q])
  	@services = @search.result
  end

  def my_favorites
  	@providers = Vote.where(:voter_id =>current_user.id,:vote_flag => true).map(&:provider)
  end

  def submissions
    if current_user.is_admin?
      @services = Service.all
    else
      @services = current_user.services
    end
  end

  def approve
    @service = Service.find(params[:id])
    @service.update(:is_approved=>"Approved")
    redirect_to submissions_path
  end

  def disapprove
    @service = Service.find(params[:id])
    @service.update(:is_approved=>"Disapproved")
    redirect_to submissions_path
  end
end
