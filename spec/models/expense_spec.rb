require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
