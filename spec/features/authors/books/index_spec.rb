# User Story 5, Authors Books Index 

# As a visitor
# When I visit '/authors/:id/books'
# Then I see each Book that is associated with that Author 
# with each Books's attributes:

require 'rails_helper'

RSpec.describe 'Authors Books Index' do
  it 'when I visit /authors/:author_id/books' do
    author = Author.create!(name: 'Stephen King')
    author2 = Author.create!(name: 'Charles Dickens')
    book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
    book2 = author.books.create!(name: 'It', length: 1138, in_print: true)
    book3 = author.books.create!(name: 'Carrie', length: 199, in_print: false)
    book4 = author2.books.create!(name: 'A Tale of Two Cities', length: 448, in_print: false)

    visit "/authors/#{author.id}/books"
save_and_open_page
    expect(page).to have_content(book1.name)
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book3.name)
    expect(page).to_not have_content(book4.name)
  end
end