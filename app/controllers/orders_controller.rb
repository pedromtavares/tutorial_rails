class OrdersController < ApplicationController

  def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.xml {render :xml => @orders}
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = User.find(@order.user)
    respond_to do |format|
      format.html
      format.xml {render :xml => @order}
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
  
end
