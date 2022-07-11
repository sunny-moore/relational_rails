# User Story 3, books Index 

# As a visitor
# When I visit '/books'
# Then I see each Book in the system including the Books's attributes:

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit /books' do
    it 'can see each book in the system with its attributes' do
      visit '/books'

      expect(current_path).to eq('/books')

      book1 = Book.create!(name: 'The Stand', length: 1152, in_print: true)
      book2 = Book.create!(name: 'It', length: 1138, in_print: true)
    end
  end
end