class UsersController < ApplicationController
  include MedicationsHelper
  def show
    @user = User.find(params[:id])
    @medications = @user.medications

    # if request.xhr?
      new_list = []
      @medications.each do |drug| 
      # if drug.brand_name 
        data = get_generics(drug)
        parsed_data = JSON.parse(data)
        generic_drug = parsed_data["Items"][0]["GenericDrugDesc"]
        new_list << generic_drug
        p "*" * 1000
        p new_list
      # else 
      #   new_list << drug 
      # end 
      end
    # end 
    
    render :show
  end

end
