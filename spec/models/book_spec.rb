require 'spec_helper'

describe Book do
  let(:blanks) { ['', nil] }
  it { should have_valid(:title).when('A Tale of Two Cities')}
  it { should_not have_valid(:title).when(*blanks)}

  it 'should optionally have a rating' do
    valid_book1 = Book.new(title: 'A Tale of Two Cities')
    valid_book2 = Book.new(title: 'A Tale of Two Cities', rating: 87)

    expect(valid_book1).to be_valid
    expect(valid_book2).to be_valid
  end

  it 'should optionally have a rating between 0 and 100' do
    invalid_book1 = Book.new(title: 'A Tale of Two Cities', rating: 135)
    invalid_book2 = Book.new(title: 'A Tale of Two Cities', rating: -20)

    expect(invalid_book1).to_not be_valid
    expect(invalid_book2).to_not be_valid
  end

  it { should have_many :checkouts }
  it { should have_many(:categorizations).dependent(:destroy) }
  it { should have_many(:categories).through(:categorizations) }

  describe  '#seed' do
    it 'should seed the database with books' do
      Book.seed
      expect(Book.where(title: 'Harry Potter').count).to eq 1
      expect(Book.where(title: 'Just Kids').count).to eq 1
      expect(Book.where(title: 'A Tale Of Two Cities').count).to eq 1
      expect(Book.where(title: 'Twilight').count).to eq 1
    end

    it 'should not create multiple records for the same book' do
      2.times { Book.seed }
      expect(Book.all.count).to eq(4)
    end
  end
end
