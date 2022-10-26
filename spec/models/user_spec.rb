require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:expenses) }
    it { should have_many(:viewers) }
    it { should have_one(:owner) }
  end
end
