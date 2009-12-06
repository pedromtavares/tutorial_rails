class AdminController < ApplicationController

  def index
    @total_orders = Order.count
  end

  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        if user.admin?
          session[:admin] = 1
          session[:user_id] = user.id;
          redirect_to :action => "index"
        else
          session[:user_id] = user.id;
          redirect_to :controller=> :personal,:action => "index"
        end
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:admin] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action=> "login")
  end

end
