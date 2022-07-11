# User Story 3, books Index 

# As a visitor
# When I visit '/books'
# Then I see each Book in the system including the Books's attributes:

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit /books' do
    it 'can see each book in the system with its attributes' do
      book1 = Book.create!(name: 'The Stand', length: 1152, in_print: true)
      book2 = Book.create!(name: 'It', length: 1138, in_print: true)
      
      visit '/books'

      expect(current_path).to eq('/books')

      expect(page).to have_content(book1.name)
      expect(page).to have_content(book1.length)
      expect(page).to have_content(book1.in_print)
      expect(page).to have_content(book2.name)
      expect(page).to have_content(book2.length)
      expect(page).to have_content(book2.in_print)
    end
  end
end