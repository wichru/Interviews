require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:email) }

    describe 'validates format of email' do
      subject do
        User.new(
          first_name: 'jan', last_name: 'kowalski',
          email: email, password: password
        ).valid?
      end

      let(:password) { '0ksymoron1' }
      let(:email) { 'johndoe@example.com' }

      context 'when email has wrong format' do
        let(:email) { 'john@foo' }

        it 'complains for invalid format' do
          is_expected.to eq false
        end

        context 'when email has wrong format' do
          let(:email) { 'john' }

          it 'complains for invalid format' do
            is_expected.to eq false
          end
        end
      end

      context 'when email has correct format' do
        let(:email) { 'john@example.com' }

        it 'accepts valid format' do
          is_expected.to eq true
        end
      end

      describe 'validates email password' do
        context 'when password is too short and without number' do
          let(:password) { 'pass' }

          it "it's invalid" do
            is_expected.to eq false
          end
        end

        context 'when password has correct value' do
          it "it's valid" do
            is_expected.to eq true
          end
        end
      end
    end
  end
end
