# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkout do
    reader_name "MyString"
    book_id 1
  end
end
