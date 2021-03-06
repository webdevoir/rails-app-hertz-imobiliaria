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
    @estados = PropertyAddress.states
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      redirect_to admin_landlord_path(@landlord)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @landlord.update(landlord_params)
      redirect_to admin_landlord_path(@landlord)
    else
      render :edit
    end
  end

  def destroy
    @landlord.destroy
    redirect_to admin_landlords_path
  end

  private

  def  landlord_params
    params.require(:landlord).permit(:name, :rg, :cpf, :birthday, :martial_status,
                                    :profession, :cep, :country, :state, :city,
                                    :neighborhood, :street, :number, :complement, :condo_name,
                                    :type_of_account, :bank, :deposit, :agency,
                                    :adm_rate, :first_rate, :account_number, phones_attributes:[:id, :phone, :_destroy],
                                    emails_attributes:[:id, :email, :_destroy] )
  end

  def set_landlord
    @landlord = Landlord.find(params[:id])
  end


end
