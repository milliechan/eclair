class MedicationsController < ApplicationController
  def new
    @medication = Medication.new 
    render :new
  end

  def create 
    @medication = Medication.create(name: params[:name])
    render :new
  end

  def index
    user = User.find(1)
    @medications = user.medications
    render :index
  end

  def edit
  end

  def update 
  end

  def destroy 
  end 
end
