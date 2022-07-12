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
    it 'can count number of books the author has(User Story 7)' do
      author = Author.create!(name: 'Stephen King')
      author2 = Author.create!(name: 'Charles Dickens')
      book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
      book2 = author.books.create!(name: 'It', length: 1138, in_print: true)
      book3 = author.books.create!(name: 'Carrie', length: 199, in_print: false)
      book4 = author2.books.create!(name: 'A Tale of Two Cities', length: 448, in_print: false)

      expect(author.count_books).to eq(3)
      expect(author2.count_books).to eq(1)
    end
  end
end
