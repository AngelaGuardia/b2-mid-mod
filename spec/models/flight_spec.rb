require 'rails_helper'

describe Flight do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :tickets }
    it { should have_many(:passengers).through(:tickets) }
  end
end
