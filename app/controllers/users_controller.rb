class UsersController < ApplicationController
	include UsersHelper
  def show
    @user = User.find(params[:id])
    @medications = @user.medications

    graph_output

    render :show
  end

  def donut
		render json: { graph: graph_output }, status: 200
	end

end
