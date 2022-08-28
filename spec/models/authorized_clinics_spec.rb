require 'rails_helper'

RSpec.describe AuthorizedClinic do
   describe 'associations' do 
    it { should belong_to :state}
   end 
end