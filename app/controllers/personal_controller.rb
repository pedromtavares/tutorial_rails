class PersonalController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @orders = Order.find :all, :conditions => ["user=?",session[:user_id]]
  end

  def show
    @order = Order.find(params[:id])
    if @order.user!=session[:user_id]
      redirect_to :action => :index
      flash[:notice] = "That order was not yours."
    end
  end

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in"
      redirect_to :controller => :admin, :action => :login
    end
  end

end
