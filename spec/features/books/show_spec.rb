# User Story 4, Books Show 

# As a visitor
# When I visit '/books/:id'
# Then I see the books with that id including the books's attributes:

require 'rails_helper'

RSpec.describe 'Books Show Page' do 
  before :each do
    @author = Author.create!(name: 'Stephen King', awards: 10, deceased: false)
    @book1 = @author.books.create!(name: 'The Stand', length: 1152, in_print: true)
    @book2 = @author.books.create!(name: 'It', length: 1138, in_print: false)
  end
  describe 'When I visit /books/:id' do
    it 'goes to that books show page' do
      visit "/books/#{@book1.id}"
 
      expect(page).to have_content(@book1.name)
      expect(page).to_not have_content(@book2.name)
    end
    it 'has a link to Update Book that takes me to /books/:id/edit' do
      visit "/books/#{@book1.id}"

      click_on('Update Book')
      expect(current_path).to eq("/books/#{@book1.id}/edit")
    end
    it 'Clicking Update Book takes me to update page where I can update the book and be redirected to books/show' do
      visit "/books/#{@book1.id}"

      click_on('Update Book')
      fill_in('Name', with: 'The Stand, Abridged')
      fill_in('Length', with: 972)
      fill_in('In print', with: true)
      click_on('Update Book')
      expect(current_path).to eq("/books/#{@book1.id}")
      expect(page).to have_content('The Stand, Abridged')
    end
  end
end
