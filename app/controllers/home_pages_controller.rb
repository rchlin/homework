class HomePagesController < ApplicationController
  def home
    @equipments = Equipment.all

    respond_to do |format|
      format.html #home.html.erb
    end
  end
end
