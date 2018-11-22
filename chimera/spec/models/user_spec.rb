require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:email) }

    describe 'email field' do
      subject { User.new(first_name: 'jan', last_name: 'kowalski', email: 'jan@foo.com').valid? }

      context 'when email has wrong format' do
        let(:email) { 'jan@foo' }

        it 'complains for invalid format' do
          is_expected.to eq false
        end

        let(:email) { 'jan' }

        it 'complains for invalid format' do
          is_expected.to eq false
        end
      end

      context 'when email has correct format' do

        it 'accepts valid format' do
          is_expected.to eq true
        end
      end
    end
  end
end
