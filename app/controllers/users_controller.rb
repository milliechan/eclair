class UsersController < ApplicationController
	include UsersHelper
  include MedicationsHelper

  def show
    @user = User.find(params[:id])
    @medications = @user.medications
    
    # if request.xhr?
      @new_list = []
      @medications.each_with_index do |drug, index| 
        # p is_brand_name?(drug)
        # if is_brand_name?(drug)
        if index < 4
          data = get_generics(drug)
          parsed_data = JSON.parse(data)
          generic_drug = parsed_data["Items"][0]["GenericDrugDesc"]
          @new_list << generic_drug
        else 
          @new_list << drug.name
        end 

      end
    # end 
    render :show
  end

  def donut
  	@user = User.find(params[:user_id])
 
		render json: { graph: graph_output(@user) }, status: 200
	end

end
