require 'rails_helper'

RSpec.describe Resource do 
  describe 'associations' do 
    it { should belong_to :state}
  end
end