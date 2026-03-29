require 'rails_helper'

RSpec.describe Bike, type: :model do
  context 'nameがある場合' do
    let(:bike) { FactoryBot.build(:bike)}

    it 'バリデーションが通ること' do 
      expect(bike).to be_valid
    end
  end

  context 'nameがない場合' do
    let(:no_name_bike) { FactoryBot.build(:bike, name: '') }

    it 'バリデーションが通らないこと' do
      expect(no_name_bike).to be_invalid
    end
  end
end
