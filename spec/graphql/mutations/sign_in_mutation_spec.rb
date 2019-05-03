# frozen_string_literal: true

RSpec.describe Mutations::SignInMutation do
  # def perform(args = {})
  #   described_class.new.call(nil, args, {current_user: nil})
  # end

  let!(:user) do
    User.create!(
      first_name: "Test",
      last_name: "User",
      email: "test@email.com",
      password: "secret"
    )
  end

  describe "authenticates user" do
    it "creates token when valid" do
      args = { email: {
        email: user.email,
        password: user.password
      }
      }
      query_result = subject.fields["sign_in_user"].resolve(nil, args, nil)

      expect(query_result.token).to be_present
      expect(query_result.user).to eq(user)
    end

    it "is nil when invalid email" do
      args = {
        email: {
          email: "invalid@email.com",
          password: user.password
        }
      }

      query_result = subject.fields["sign_in_user"].resolve(nil, args, nil)

      expect(query_result).to be_nil
    end

    it "is nil when invalid password" do
      args = {
        email: {
          email: user.email,
          password: "invalid"
        }
      }

      query_result = subject.fields["sign_in_user"].resolve(nil, args, nil)

      expect(query_result).to be_nil
    end
  end
end
