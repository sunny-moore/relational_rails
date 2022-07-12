require 'rails_helper'

RSpec.describe Book do 
  describe 'relationships' do 
    it { should belong_to (:author) }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :length }
    # it { should validate_inclusion_of :in_print, in: [true, false] }
  end
end