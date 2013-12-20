require 'spec_helper'

describe Categorization do
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :book_id }

  it { should belong_to :book }
  it { should belong_to :category }
end
