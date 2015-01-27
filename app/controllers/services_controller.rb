class ServicesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create, :if => :ajax_request
  before_action :set_service, only: [:show, :edit, :update, :destroy,:new_service_update]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    if ajax_request
      @service = Service.new(image: asset_params[:image])
      @service.user_id = current_user.id
      if current_user.is_admin?
        @service.is_approved = "Approved"
      end
      if @service.save(:validate=>false)
        render json: @service
      else
        head :bad_request
      end
    else
      # @service = Service.new(service_params)
      # @service.user_id = current_user.id
      # if current_user.is_admin?
      #   @service.is_approved = "Approved"
      # end
      # if @service.save
      #   redirect_to services_path , :flash => { :success => "Your sevice is created successfully" }
      # else
      #   render :new
      # end
    end
  end

  def update
    update_service
  end

  def new_service_update
    update_service
  end

  def destroy
    @service.destroy
    flash[:success] = 'Your service is deleted successfully'
    redirect_to services_path
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description, :imageurl, :category_id , :image)
    end

    def ajax_request
      params[:xhr]
    end

    def asset_params
      params.permit(:image)
    end

    def update_service
      if @service.update(service_params)
        flash[:success] = 'Your service is updated successfully'
        redirect_to service_path(@service)
      else
        render :edit
      end
    end
end
