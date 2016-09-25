class MedicationsController < ApplicationController
  include MedicationsHelper
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
    # p "*" * 1000
    # p "I MADE IT"
    # @user = User.first 
    # # if request.xhr? 
    #   new_list = []
    #   @user.medications.each do |drug| 
    #     # if drug.brand_name 
    #       data = get_generics(drug)
    #       generic_drug = data[:Items][0][:GenericDrugDesc]
    #       new_list << generic_drug
    #     # else 
    #     #   new_list << drug 
    #     # end 
    #   end
    #   p "*" * 1000
    #   p new_list
      # calculator(new_list)
    # end

  end

  def update 
  end

  def destroy 
  end 
end
