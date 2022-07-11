require 'rails_helper'

RSpec.describe Author do
  # describe 'validations' do
  #   it { should validate_presence_of (:name) }
  #   it { should validate_presence_of :awards }
  #   it { should validate_presence_of :deceased }
  # end
  describe 'instance methods' do
    describe '#deceased' do
      it 'is false by default' do
        author = Author.new(name: 'Stephen King')

        expect(author.deceased?).to be false
      end
      it 'it is true for deceased?' do
        author = Author.new(name: 'Charles Dickens', deceased: true)

        expect(author.deceased?).to be true
      end
    end
    describe '#awards' do
      it 'is nil/zero by default' do
        author = Author.new(name: 'Stephen King')

        expect(author.awards).to eq(0)
      end
      it 'can be set to an integer value' do
        author = Author.new(name: 'Stephen King', awards: 5)

        expect(author.awards).to eq(5)
      end
    end
    describe '#name' do
      it 'you can specify a name' do
        author = Author.new(name: 'Stephen King')

        expect(author.name).to eq('Stephen King')
      end
    end
  end
end
