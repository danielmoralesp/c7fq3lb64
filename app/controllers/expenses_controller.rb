class ExpensesController < ApplicationController
  before_action :authenticate_user!

  #include Devise::Controllers::Helpers
  #helper_method :current_user

  def index
    user = current_user
  	if params[:concept] or params[:category_id]
  	  @expenses = Expense.search(user.id, params[:concept], params[:category_id].to_i).order("date DESC")
  	else
  	  @expenses = Expense.where("user_id = ? ", "#{user.id}").order("date DESC")
  	end
  end


  #def index
  #  if current_user != nil
  #    @expenses = Expense.order('date DESC')
  #   	@expenses =  @expenses.concept(params[:concept]) if params[:concept].present?
  #   	@expenses = @expenses.category_id(params[:category_id]) if params[:category_id].present?
  #  end

    #@expenses = current_user.@expenses
    #@user = current_user.email
    #@curren_user = current_user
  #end
end

#@expenses = Expense.order("date DESC")
#product = Product.find(params[:product_id])
#@product = Product.find(params[:id])
#@expenses = Expense.find(params[:category_id])

#expenses = Expense.where(params[:category_id])
#@expenses = expenses.order("date DESC")

=begin
Solucion que funciona explicitamente
my_where_params = params.permit(:concept, :category_id).select {|k,v| v.present?}
expenses = Expense.where(my_where_params)
@expenses = expenses.order("date DESC")

if params[:concept, :category_id].present?
  search = params[:concept, :category_id].downcase
  expenses = Expense.where(search)
  @expenses = expenses.order("date DESC")
end
=end
