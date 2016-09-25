class MedicationsController < ApplicationController
  def new
    @medication = Medication.new 
    render :index
  end

  def create 
    @user = User.find(1)
    @medication = Medication.create(name: params[:name])
    UserMedication.create(user_id: 1, medication_id: @medication.id)
    @medications = @user.medications
    render :index
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
