class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :categorizations, dependent: :destroy
  has_many :books, through: :categorizations

  class << self
    def seed
      categories = ['Fiction', 'Non-fiction', 'Childrens', 'Sci-Fi', 'Mystery']
      categories.each do |category|
        unless Category.where(name: category).exists?
          new_category = Category.new(name: category)
          new_category.save
          puts "#{category} created!"
        else
          puts "#{category} already exists."
        end
      end
    end
  end
end
