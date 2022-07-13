# User Story 4, Books Show 

# As a visitor
# When I visit '/books/:id'
# Then I see the books with that id including the books's attributes:

require 'rails_helper'

RSpec.describe 'Books Show Page' do 
  describe 'When I visit /books/:id' do
    it 'goes to that books show page' do
      author = Author.create!(name: 'Stephen King', awards: 10, deceased: false)
      book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
      book2 = author.books.create!(name: 'It', length: 1138, in_print: false)

      visit "/books/#{book1.id}"
 save_and_open_page
      expect(page).to have_content(book1.name)
      expect(page).to_not have_content(book2.name)
    end
  end
end
