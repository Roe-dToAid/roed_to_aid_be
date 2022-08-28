require 'rails_helper'

RSpec.describe MisinformationCenter do 
  describe 'associations' do 
    it { should belong_to :state}
  end
end