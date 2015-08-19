class ExternalServicesController < ApplicationController
  crud_list_options :external_service, title: :name

  def index
    @external_services = ExternalService.all
  end

  def create
    @external_service = ExternalService.new(params[:external_service])
    if @external_service.save
      flash.now[:notice] = "External service created"
      render crud_list_append(:external_service, @external_service)
    else
      flash.now[:alert] = "External service could not be created"
      render crud_list_new(:external_service, @external_service)
    end
  end

  def update
    @external_service = ExternalService.find(params[:id])
    if @external_service.update_attributes(params[:external_service])
      flash.now[:notice] = "External service updated"
    else
      flash.now[:alert] = "External service could not be updated"
    end
    render crud_list_update(:external_service, @external_service)
  end

  def destroy
    @external_service = ExternalService.find(params[:id])
    @external_service.destroy
    flash.now[:notice] = "External service removed"
    render crud_list_remove(:external_service, @external_service)
  end

  def reload
    @external_service = ExternalService.find(params[:id])
    flash.now[:notice] = "External service reloaded"
    render crud_list_update(:external_service, @external_service, expanded: true)
  end
end
