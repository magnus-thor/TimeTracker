# frozen_string_literal: true

RSpec.describe Types::ProjectType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has an :id field of ID type" do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it "has a :title field of String type" do
    expect(subject).to have_field(:name).that_returns(!types.String)
  end

  it "has a :description field of String type" do
    expect(subject).to have_field(:description).that_returns(!types.String)
  end
end
