require 'rails_helper'

RSpec.describe "Expenses", type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get expenses_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:valid_expense) { create(:expense, user_id: user.id) }

    it 'renders a successful response' do
      get expense_path(valid_expense)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_expense_url
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    let(:valid_expense) { create(:expense, user_id: user.id) }

    it 'render a successful response' do
      get edit_expense_url(valid_expense)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_expense) do
        {
          name: Faker::Lorem.word,
          value: Faker::Number.number(digits: 6),
          description: Faker::Lorem.sentence,
          category: Expense.categories.keys.sample,
          user_id: user.id
        }
      end

      it 'creates a new Expense' do
        post expenses_url, params: { expense: valid_expense }
        expect(response).to redirect_to(assigns(:expense))
        follow_redirect!
        expect(response).to render_template(:show)
      end

      it 'creates a new instance of Expense with correct values' do
        expect { post expenses_url, params: { expense: valid_expense } }.to change(Expense, :count).by(1)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:valid_expense) { create(:expense, user_id: user.id) }
      let(:edited_expense) do
        {
          name: Faker::Lorem.word,
          value: Faker::Number.number(digits: 6)
        }
      end

      it 'updates the requested post' do
        get edit_expense_url(valid_expense)
        expect(response).to render_template(:edit)
        patch expense_path(valid_expense), params: { expense: edited_expense }
        expect(response).to redirect_to(expense_path(valid_expense))
        follow_redirect!
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:valid_expense) { create(:expense, user_id: user.id) }

    it 'destroys the requested album' do
      expect { delete expense_path(valid_expense) }.to change(Expense, :count).by(-1)
    end

    it 'redirects to the albums list' do
      delete expense_path(valid_expense)
      expect(response).to redirect_to(expenses_url)
    end
  end
end
