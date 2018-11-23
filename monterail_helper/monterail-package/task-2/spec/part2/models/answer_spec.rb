RSpec.describe Answer, type: :model do
  it "allows values 'yes' and 'no'" do
    expect { Answer.create!(value: "yes") }.not_to raise_error
    expect { Answer.create!(value: "no") }.not_to raise_error
  end

  it "doesn't allow other values than 'yes' or 'no'" do
    expect { Answer.create!(value: "something") }.to raise_error(ActiveRecord::RecordInvalid)
    expect { Answer.create!(value: "") }.to raise_error(ActiveRecord::RecordInvalid)
  end
  it { is_expected.to allow_value("yes", "no").for(:value) }
  it { is_expected.to validate_presence_of(:value) }
end
