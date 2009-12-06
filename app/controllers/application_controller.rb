# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  layout "store"
  before_filter :authorize, :prepare_time, :except => [:login,:register]

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  protected

  def authorize
    unless User.find_by_id(session[:user_id]) and session[:admin]
      flash[:notice] = "Please log in as an administrator"
      redirect_to :controller => :admin, :action => :login
    end
  end

  def prepare_time
    @time = Time.now
  end

end
