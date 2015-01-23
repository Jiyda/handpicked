class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

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
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if current_user.is_admin?
      @service.is_approved = "Approved"
    end
    if @service.save
      redirect_to services_path , :flash => { :success => "Your sevice is created successfully" }
    else
      render :new
    end
  end

  def update
    if @service.update(service_params)
      flash[:success] = 'Your service is updated successfully'
      redirect_to service_path(@service)
    else
      render :edit
    end
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
end
