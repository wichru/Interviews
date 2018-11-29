require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "validations" do
    it { is_expected.to validate_length_of(:name).is_at_most(200) }
  end
end
