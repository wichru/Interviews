require 'rails_helper'

RSpec.describe Registration do
  describe "#submit!" do
    context "when it's valid" do
      let(:registration) do
        Registration.new(
          first_name: "John", last_name: "Doe", email: "john@doe.com",
          password: "password", password_confirmation: "password",
          street: "main st.", city: "city", zip_code: "00-342", country: "usa"
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
      let(:registration) { Registration.new }

      it "returns false" do
        expect(registration.submit!).to eq false
      end
      it "doesn't create user" do
        expect{ registration.submit!}.to change{ User.count }.by(0)
      end
      it "doesn't create user's address"
      it "doesn't create company"
      it "doesn't create company address"
    end
  end
end
