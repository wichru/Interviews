require 'rails_helper'

RSpec.describe Registration do
  describe "#submit!" do
    context "when it's valid" do
      let(:registration) do
        Registration.new(
          first_name: "John", last_name: "Doe", email: "john@doe.com",
          password: "password", password_confirmation: "password"
        )
      end

      it "returns true" do
        expect(registration.submit!).to eq true
      end

      it "creates a user" do
        expect{ registration.submit! }.to change{ User.count }.by(1)
        user = User.order(:created_at).last
        expect(user.first_name).to eq "John"
        expect(user.last_name).to eq "Doe"
      end
    end

    context "when it's invalid" do
      it "returns false" do
        registration = Registration.new

        expect(registration.submit!).to eq false
      end
      it "doesn't create user"
      it "doesn't create user's address"
      it "doesn't create company"
      it "doesn't create company address"
    end
  end
end
