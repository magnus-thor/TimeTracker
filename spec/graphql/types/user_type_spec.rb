# frozen_string_literal: true

RSpec.describe Types::UserType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has an :id field of ID type" do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it "has a :title field of String type" do
    expect(subject).to have_field(:email).that_returns(!types.String)
  end

  it "has a :description field of String type" do
    expect(subject).to have_field(:first_name).that_returns(!types.String)
  end

  it "has a :duration field of String type" do
    expect(subject).to have_field(:last_name).that_returns(!types.String)
  end
end
