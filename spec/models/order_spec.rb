require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validation' do
    context 'order complete' do
      let(:order) { build(:order) }

      it { expect(order).to be_valid }
    end

    context 'incomplete order' do
      let(:address) { create(:address) }
      let(:order) { build(:order, name: nil, address: address) }

      it { expect(order).to_not be_valid }
    end

    context 'order with invalid name' do
      context 'only alphabetic letters' do
        %w(0name name0 $name name$ n$me n0me).each do |name|

          let(:order) { build(:order, name: name) }

          it { expect(order).to be_invalid }
        end
      end

      context 'less than two characters' do
        let(:order) { build(:order, name: 'A') }

        it { expect(order).to be_invalid }
      end
    end

    context 'order with valid phone' do
      context 'only alphabetic letters' do
        ['(999) 9999-9999', '(9) 99999999'].each do |phone|
          let(:order) { build(:order, phone: phone) }

          it { expect(order).to be_invalid }
        end
      end
    end

    context 'order with invalid email' do
      context 'only alphabetic letters' do
        %w(test@ test@test test@test. @test @test.com test@test.com.br.br).each do |name|
          let(:order) { build(:order, name: name) }

          it { expect(order).to be_invalid }
        end
      end
    end
  end
end
