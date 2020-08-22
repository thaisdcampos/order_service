require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validation' do
    context 'complete address' do
      let(:address) { build(:address) }

      it { expect(address).to be_valid }
    end

    context 'incomplete address' do
      let(:address) { build(:address, street: nil) }

      it { expect(address).to be_invalid }
    end

    context 'address with invalid zip_code' do
      let(:address) { build(:address, zip_code: '09361020') }

      it { expect(address).to be_invalid }
    end
  end
end
