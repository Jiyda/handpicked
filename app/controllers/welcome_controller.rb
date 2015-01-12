class WelcomeController < ApplicationController
  def index
  	@services = Service.all
  end

  def search
  	@search = Service.search(params[:q])
  	@services = @search.result
  end
end
