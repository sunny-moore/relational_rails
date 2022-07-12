require 'rails_helper'

RSpec.describe 'authors#index', type: :feature do
  describe 'User Story 1' do
    it 'can show all the authors' do
      author1 = Author.create!(name: 'Stephen King')
      author2 = Author.create!(name: 'Charles Dickens')
      visit '/authors'

      expect(page).to have_content(author1.name)
      expect(page).to have_content(author2.name)
    end
  end
  describe 'User Story 6' do
    it 'shows all authors, sorted by most recently created' do 
      author1 = Author.create!(name: 'Stephen King')
      author2 = Author.create!(name: 'Charles Dickens')

      visit '/authors'
      
      expect(page.body.index(author2.name)).to be < (page.body.index(author1.name))
    end
  end
  describe 'User Story 7' do
    xit 'authors show page shows a count of all books associated with it' do
      author1 = Author.create!(name: 'Stephen King')
      book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
      book2 = author.books.create!(name: 'It', length: 1138, in_print: true)

      visit "/authors/#{author.id}"
    end
  end
end