class Author < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :awards
    validates_presence_of :deceased

    has_many :books
end