require 'rails_helper'

describe Passenger do
  describe 'relationships' do
    it { should have_many :tickets }
    it { should have_many(:flights).through(:tickets) }
  end
end
