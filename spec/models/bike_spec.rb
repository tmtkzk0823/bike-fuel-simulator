require 'rails_helper'

RSpec.describe Bike, type: :model do
  context 'nameがある場合' do
    let(:bike) { FactoryBot.build(:bike)}

    it 'バリデーションが通ること' do 
      expect(bike).to be_valid
    end
  end
end
