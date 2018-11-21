require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:email) }

    context 'when email has wrong format' do

      it 'complains for invalid format' do

      end
    end

    context 'when email has correct format' do

      it 'accepts valid format' do

      end
    end
  end
end
