class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  
  def not_found
    @title = "404"
    render "application/not_found", :status => 404
  end
end
