require 'rails_helper'

RSpec.describe SharedList, type: :model do
  describe 'validations' do
  end

  describe 'associations' do
    it { should belong_to(:owner) }
    it { should belong_to(:viewer) }
  end
end
