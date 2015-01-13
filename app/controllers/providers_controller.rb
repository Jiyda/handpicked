class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.all
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to provider_path(@provider)
    else
      render :new
    end
  end

  def update
    if @provider.update(provider_params)
      redirect_to provider_path(@provider)
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_path
  end
  
  def upvote
    @provider = Provider.find(params[:id])
    if @provider.votes.where(:voter_id =>current_user.id,:vote_flag => true).blank?
      @provider.vote_by :voter => current_user, :vote => 'like'
    end
    render :layout => false
  end

  def downvote
    @provider = Provider.find(params[:id])
    if @provider.votes.where(:voter_id =>current_user.id,:vote_flag => false).blank?
      @provider.vote_by :voter => current_user, :vote => 'bad'
    end
    render :layout => false
  end



  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name, :description, :website, :pricerange, :rating, :imageurl , :service_id, :imageurl)
    end
end
