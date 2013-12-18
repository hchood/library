require 'spec_helper'

describe Checkout do
  it { should have_valid(:reader_name) }
  it { should have_valid(:book_id) }
  it { should have_valid(:due_date) }
  # the above tests pass simply w/ null constraints on the data, no validations

  it { should belong_to :book }
end
