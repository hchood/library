class Checkout < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :reader_name, :due_date, :book_id
  validates :due_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
end
