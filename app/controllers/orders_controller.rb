class OrdersController < ApplicationController
  before_filter :signed_in_user

  def index
    if !params[:user_id].nil?
      @user = User.find(params[:user_id])
      @orders = @user.orders
    elsif !params[:equipment_id].nil?
      @equipment = Equipment.find(params[:equipment_id])
      @orders = @equipment.orders
    else
      flash[:error] = 'no such pages'
      redirect_to root_path
    end
  end
  def new
    @equipment = Equipment.find(params[:equipment_id])
    if !@equipment.nil?
      @order = Order.new
      #@order.equipment = @equipment
      @order.equipment_name= @equipment.name
      @order.equipment_num= @equipment.number
      @order.use_start_date= @equipment.able_start_time
      @order.use_end_date= @equipment.able_end_time
    else
      flash[:error] = 'no equipments selected!'
      redirect_to root_path
    end
  end
  def create
    @order = current_user.orders.build(params[:order])
    @order.equipment = Equipment.find(params[:equipment_id])

    if @order.save
      flash[:success] = 'new orders created!'
      redirect_to user_orders_path(current_user)
    else
      flash[:error] = 'orders created fail!'
      redirect_to root_path
    end
  end
end
