require 'spec_helper'

describe Category do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  # it { should have_many(:books) }

  describe '#seed' do
    it 'should seed categories' do
      Category.seed
      expect(Category.where(name: 'Fiction').count).to eq 1
      expect(Category.where(name: 'Non-fiction').count).to eq 1
      expect(Category.where(name: 'Childrens').count).to eq 1
      expect(Category.where(name: 'Sci-Fi').count).to eq 1
      expect(Category.where(name: 'Mystery').count).to eq 1
    end

    it 'should not seed duplicate categories' do
      2.times { Category.seed }
      expect(Category.all.count).to eq 5
    end
  end
end
