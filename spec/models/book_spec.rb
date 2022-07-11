require 'rails_helper'

RSpec.describe Book do 
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :length }
    it { should validate_presence_of :in_print }
  end
  #   describe 'instance methods' do
#     describe '#name' do
#       it 'you can specify a name' do
#         book = Book.new(name: 'The Stand')

#         expect(book.name).to eq('The Stand')
#       end
#       describe '#in_print?' do 
#         it 'is false by default' do
#           book = Book.new(name: 'The Stand')

#           expect(book.in_print?).to eq(false)
#         end
#         it 'can be set to true' do
#           book = Book.new(name: 'The Stand', in_print: true)
          
#           expect(book.in_print?).to eq(true)
#         end

#         describe '#length' do
#           it 'is zero by default' do
#             book = Book.new(name: 'The Stand')

#             expect(book.length).to eq(0)
#           end
#           it 'can be set to an integer value' do
#             book = Book.new(name: 'The Stand', length: 1152)

#             expect(book.length).to eq(1152)
#           end
#         end
#       end
#     end
#   end
end