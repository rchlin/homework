class EquipmentsController < ApplicationController
  before_filter :signed_in_user, except: [:show]

  def index
    @user = User.find(params[:user_id])
    if !@user.nil?
      @equipments = @user.equipments
    end
  end

  def new
    @equipment = Equipment.new
    @user = User.find(params[:user_id])

  end

  def create
    @equipment = current_user.equipments.build(params[:equipment])

    if @equipment.save
      flash[:success] = 'new equipments success!!'
      redirect_to equipments_path
    else
      redirect_to new_equipment_path
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @equipment = Equipment.find(params[:id])

    if @equipment.update_attributes(params[:equipment])
      flash[:success] = 'equipment updated success!!'
      redirect_to user_equipments_path(@user)
    else
      flash.now[:error] = 'equipment updated fail.'
      render 'edit'
    end
  end

  private
  def signed_in_user
    redirect_to signin_path, notice: 'Please sign in.' unless signed_in?
  end
end
