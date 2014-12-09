class HomePagesController < ApplicationController
  def home
    @equipments = Equipment.all

    respond_to do |format|
      format.html #home.html.erb
    end
  end
  def manager

  end
  def manager_orders
    @user = User.find(params[:user_id])
    
    if current_user?(@user)
      @equipments = @user.equipments
      @orders = Array.new
      @equipments.each { |equipment| @orders = @orders + equipment.orders }

    else
      flash[:error] = 'user is not correct!'
      redirect_to manager_path
    end
  end
  def search
    @equipments = Equipment.find_all_by_name(params[:equipment][:name])
    #flash[:notice] = params[:equipment][:name]
    respond_to do |format|
      format.html { render 'home'}
    end
  end
  def check_order
    @order = Order.find(params[:order_id])
  end
  def check
    @order = Order.find(params[:order_id])

    if @order.update_attributes(params[:order])
      flash[:success] = 'confirmed success'
      redirect_to :controller => :home_pages, :action => :manager_orders, :user_id => current_user.id
    else
      flash[:error] = 'confirmed fail'
      redirect_to :controller => :home_pages, :action => :manager_orders, :user_id => current_user.id
    end
  end
end
