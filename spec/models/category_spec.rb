require 'spec_helper'

describe Category do
  it { validates_presence_of :name }
  it { validates_uniqueness_of :name }

  it { has_many(:books) }

  describe '#seed' do

  end
end
