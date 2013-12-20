class Categorization < ActiveRecord::Base
  validates_presence_of :category_id, :book_id

  belongs_to :category
  belongs_to :book
end
