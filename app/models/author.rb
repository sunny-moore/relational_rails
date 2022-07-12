class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :awards
  validates :deceased, inclusion: [true, false]

  has_many :books

  def self.order_by_created_at
    Author.order(created_at: :desc)
  end
  def count_books
    books.count
  end
end
