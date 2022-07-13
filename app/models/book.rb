class Book < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :length
  validates_inclusion_of :in_print, in: [true, false]
  
  belongs_to :author

  def self.in_print_true 
    Book.where(in_print: true)
  end
end