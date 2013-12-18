class Book < ActiveRecord::Base
  validates_presence_of :title
  validates :rating, inclusion: (0..100), allow_blank: true
end
