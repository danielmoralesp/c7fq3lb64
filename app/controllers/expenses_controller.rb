class ExpensesController < ApplicationController
  def index
    my_where_params = params.permit(:concept, :category_id).select {|k,v| v.present?}
    expenses = Expense.where(my_where_params)
    @expenses = expenses.order("date DESC")
  end
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
