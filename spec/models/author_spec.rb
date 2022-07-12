require 'rails_helper'

RSpec.describe Author do
  describe 'relationships' do
    it { should have_many(:books) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:awards) }
    it { should allow_value(true).for(:deceased) }
    it { should allow_value(false).for(:deceased) }
  end
  describe 'instance methods' do
    it 'can order by created_at' do
      Author.create!(name: 'Stephen King', awards: 27, deceased: false)
      Author.create!(name: 'Charles Dickens', awards: 5, deceased: true)

      authors = Author.order_by_created_at

      expect(authors.first.name).to eq('Charles Dickens')
    end
  end
end
