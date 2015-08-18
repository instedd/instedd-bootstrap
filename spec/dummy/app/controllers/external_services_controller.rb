class ExternalServicesController < ApplicationController
  def index
    @external_services = ExternalService.all
  end

  def create
    @external_service = ExternalService.new(params[:external_service])
    if @external_service.save
      render crud_list_append(:external_service, @external_service)
    else
      render crud_list_new(:external_service, @external_service)
    end
  end

  def update
    @external_service = ExternalService.find(params[:id])
    @external_service.update_attributes(params[:external_service])
    render crud_list_update(:external_service, @external_service)
  end

  def destroy
    @external_service = ExternalService.find(params[:id])
    @external_service.destroy
    render crud_list_remove(:external_service, @external_service)
  end
end
