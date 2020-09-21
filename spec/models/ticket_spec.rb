require 'rails_helper'

describe Ticket do
  describe 'relationships' do
    it { should belong_to :flight }
    it { should belong_to :passenger }
  end
end
