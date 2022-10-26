# frozen_string_literal: true

class SharedListsController < ApplicationController
  def index
    @list = SharedList.joins("INNER JOIN expenses on expenses.user_id = shared_lists.viewer_id")
  end

  def new
    @list = SharedList.new
  end

  def create
    viewer = User.find_by(email: expense_params[:email])
    if viewer
      expense_params.delete(:email)
      expense_params[viewer_id] = viewer.id
      @list = SharedList.new(expense_params)

      if @list.save
        redirect_to expenses_url, notice: 'You shared your list.'
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, notice: "There isn't a user with this email."
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:email).with_defaults(owner_id: current_user)
  end
end
