require 'rails_helper'

RSpec.describe State do 
  describe 'associations' do 
    it { should have_many :authorized_clinics }
    it { should have_many :misinformation_centers }
    it { should have_many :resources }
  end
end