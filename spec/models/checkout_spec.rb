require 'spec_helper'

describe Checkout do
  let(:blanks) { ['', nil] }
  let(:invalid_dates) { ['dec 3', 2013, '12/25/2013', Date.new(2013,12,3), 1.month.ago] }
  let(:valid_dates) { [7.days.from_now, 1.month.from_now] }
  let(:book) { Book.create(title: 'A Tale of Two Cities')}

  it { should have_valid(:reader_name).when('Helen Hood') }
  it { should_not have_valid(:reader_name).when(*blanks) }

  it { should have_valid(:book_id).when(book.id) }  # Does this test really do anything?  It passes without any validation in my model
  it { should_not have_valid(:book_id).when(*blanks) }

  it { should have_valid(:due_date).when(*valid_dates) }
  it { should_not have_valid(:due_date).when(*invalid_dates) }
  it { should_not have_valid(:due_date).when(*blanks) }

  it { should belong_to :book }
end
