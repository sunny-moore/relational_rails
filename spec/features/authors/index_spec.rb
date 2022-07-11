require 'rails_helper'

RSpec.describe 'authors#index', type: :feature do
  it 'can show all the authors' do
    author_1 = Author.create(name: 'Stephen King')
    author_2 = Author.create(name: 'Charles Dickens')
    visit('/authors')

    expect(page).to have_content(author_1.name)
    expect(page).to have_content(author_2.name)
  end
end