# User Story 3, books Index 

# As a visitor
# When I visit '/books'
# Then I see each Book in the system including the Books's attributes:

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit /books' do
    before :each do
      @author = Author.create!(name: 'Stephen King', deceased: false, awards: 10)
      @book1 = @author.books.create!(name: 'The Stand', length: 1152, in_print: true)
      @book2 = @author.books.create!(name: 'It', length: 1138, in_print: true)
    end
    it 'can see each book in the system with its attributes' do
      visit '/books'

      expect(current_path).to eq('/books')
      expect(page).to have_content(@book1.name)
      expect(page).to have_content(@book1.length)
      expect(page).to have_content(@book1.in_print)
      expect(page).to have_content(@book2.name)
      expect(page).to have_content(@book2.length)
      expect(page).to have_content(@book2.in_print)
    end
  end
  it 'shows a link to books index on every page(User Story 8)' do
    visit '/books'
    expect(page).to have_link('Books Index')

    visit '/authors'
    expect(page).to have_link('Books Index')

    author2 = Author.create!(name: 'Stephen King', deceased: false, awards: 10)
    visit "/authors/#{author2.id}"
    expect(page).to have_link('Books Index')
  end
  describe 'User Story 15 - books index only shows in_print: true' do
    it 'Only shows books whose in_print is true' do
      visit '/books'

      expect(page).to_not have_content('In Print: false')
    end
  end
end
