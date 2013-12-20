class Book < ActiveRecord::Base
  validates_presence_of :title
  validates :rating, inclusion: (0..100), allow_blank: true

  has_many :checkouts
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  class << self
    def seed
      require 'csv'
      filename = '/Users/helenhood/Dropbox/launchacademy/Charlie/library/db/data/books_seed.csv'
      CSV.foreach(filename, headers: true) do |row|
        book_hash = {
          title: row['title'],
          author: row['author'],
          rating: row['rating']
        }
        unless Book.where('title = ? AND author = ?', book_hash[:title], book_hash[:author]).exists?
          book = Book.new(book_hash)
          book.save
          puts "#{book.title} saved!"
        else
          puts "#{book_hash[:title]} already exists."
        end
      end
    end
  end
end
