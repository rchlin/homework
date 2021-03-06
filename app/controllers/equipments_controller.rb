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
    @equipment.owner = @user.name
    @equipment.belong_to_institution = @user.institution

  end

  def create
    @equipment = current_user.equipments.build(params[:equipment])

    if @equipment.save
      flash[:success] = 'new equipments success!!'
      redirect_to user_equipments_path(current_user)
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

  def destroy
    @equipment = Equipment.find(params[:id])
    if @equipment.user.eql?current_user
      @equipment.destroy
      redirect_to user_equipments_path(current_user)
    else
      flash[:error] = "equipment destroy error"
      redirect_to user_equipments_path(current_user)
    end
  end

  private
  def signed_in_user
    redirect_to signin_path, notice: 'Please sign in.' unless signed_in?
  end
end
