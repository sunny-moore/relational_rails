require 'rails_helper'

RSpec.describe Author do
  describe 'relationships' do
    it { should have_many(:books)}
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:awards) }
    it { should validate_presence_of(:deceased) }
  end
  
end
