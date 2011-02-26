class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  
  def not_found
    render "application/not_found", :status => 404
  end
end
