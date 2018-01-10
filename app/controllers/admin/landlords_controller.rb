class Admin::LandlordsController < ApplicationController
before_action :set_landlord, only: [:edit, :update, :destroy, :show]
  def index
    if params[:query].present?
      @landlords = Landlord.search(params[:query])
    else
      @landlords = Landlord.all
    end
  end

  def show

  end

  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = current_user.landlords.new(landlord_params)
    if @landlord.save
      redirect_to admin_landlords_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @landlord.update(landlord_params)
      redirect_to admin_landlords_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def  landlord_params
    params.require(:landlord).permit(:name, :rg, :cpf, :birthday, :martial_status, :profession, :phone, :email, :address, :cep, :deposit, :adm_rate, :first_rate)
  end

  def set_landlord
    @landlord = Landlord.find(params[:id])
  end

end
