class Book < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :length
  validates_presence_of :in_print
end