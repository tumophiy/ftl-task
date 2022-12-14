# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @categories = Expense.all.order(:category).pluck(:category).uniq
    @values = Expense.all.order(:value).pluck(:value).uniq
    @expenses = Expense.all
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to expense_url(@expense), notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to expense_url(@expense), notice: 'Expense was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy

    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :description, :value, :category).with_defaults(user: current_user)
  end
end
