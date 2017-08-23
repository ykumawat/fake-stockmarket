class InvestmentsController < ApplicationController
  before_action :require_logged_in

def index
	@investments = Investment.all
end

def new
  @investment = Investment.new
end

def create
  @investment = Investment.create(user_id: current_user.id, stock_id: params[:investment][:stock_id], quantity: params[:investment][:quantity])
  @investment.make_investment(params[:investment][:quantity])
  redirect_to user_path(current_user)
end


end
