class Admin::LandlordsController < ApplicationController

  def index
    @landlords = Landlord.all
  end

  def show
  end

  def create
  end

  def new
    @landlord = Landlord.new
    @bank_account = BankAccount.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
