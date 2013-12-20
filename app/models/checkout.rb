class Checkout < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :reader_name, :due_date, :book_id
  validates_date :due_date, after: lambda { Date.current }
end
