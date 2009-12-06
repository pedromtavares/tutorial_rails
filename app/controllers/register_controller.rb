class RegisterController < ApplicationController
  
  def index
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Greetings #{@user.name}, your registration was successful."
        format.html { redirect_to(:controller => :personal,:action => :index) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def authorize
  end

end
